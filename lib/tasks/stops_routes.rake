namespace :metro_data do 

	desc "Import raw LA Metro data from CSV to database"
	task :add_raw => [:environment] do 
		require 'csv'

		# build csv / model library
		files_to_load = Hash.new
		files_to_load["lib/assets/routes.csv"] = RawRoute
		files_to_load["lib/assets/stops.csv"] = RawStop
		files_to_load["lib/assets/stop_times.csv"] = RawStopTime
		files_to_load["lib/assets/trips.csv"] = RawTrip

		files_to_load.each do |filename, thisModel|
			# clear previous data
			thisModel.delete_all
			
			# read lines from csv, create table headers from csv header
			lines = File.new(filename).readlines
			header = lines.shift.strip
			keys = header.split(',')
			
			# for each line, store value in relevant column
			lines.each do |line|
				values = line.strip.split(',')
				attributes = Hash[keys.zip values]
				thisModel.create(attributes)
			end

			puts "Completed loading #{filename}..."

		end
	end

	desc "Compile summary route and stop information from raw LA Metro data in database"
	task :add_routes_stops => [:environment] do

		# reset routes
		Route.delete_all

		# populate table with useful route data
		RawRoute.find_each do |raw_route|
			route = Route.new

			route.route_id = raw_route.route_id
			route.route_short_name = raw_route.route_short_name
			route.route_long_name = raw_route.route_long_name
			route.route_desc = raw_route.route_desc

			route.save
		end

		# reset stops
		Stop.delete_all

		# populate table with useful stop data
		RawStop.find_each do |raw_stop|
			stop = Stop.new

			stop.stop_id = raw_stop.stop_id
			stop.stop_name = raw_stop.stop_name
			stop.stop_lat = raw_stop.stop_lat
			stop.stop_lon = raw_stop.stop_lon

			stop.save
		end
	end

	# store stops in appropriate route
	desc "Associate stops to their proper routes, and vice versa"
	task :associate_stops_to_routes => [:environment, :add_routes_stops] do

		# populate stops library
		all_stops = Hash.new
		Stop.all.each do |stop|
			all_stops[stop.stop_id] = stop.id
		end

		all_routes = Route.all
		counter = 1
		# two_routes = []
		# two_routes << Route.first
		# two_routes << Route.last

		# iterate through each route
		all_routes.each do |r|
			trips = RawTrip.where(route_id: r.route_id)

			puts "Processing #{r.route_short_name}: # #{counter} of #{all_routes.length}"

			# holder for winning trip (for route!)
			route_trip = trips.first

			# initialize
			longest_trip = 0

			# iterate through each trip for route
			trips.each do |trip|

				# grab all stops for a given trip
				trip_stops = RawStopTime.where(trip_id: trip.trip_id)

				# keep track of longest trip (most # stops)
				if trip_stops.length > longest_trip
					longest_trip = trip_stops.length
					route_trip = trip
				end

			end

			puts "Done processing route. Moving to stop_times..."

			# get all stops for given route
			route_stops = RawStopTime.where(trip_id: route_trip.trip_id)

			# store primary keys in route_stops table
			route_stops.each do |s|
				RouteStop.create!(route_id: r.id, stop_id: all_stops[s.stop_id], stop_sequence: s.stop_sequence)
			end

			counter += 1

		end

	end
end

