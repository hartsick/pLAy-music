require 'json'

namespace :hotspot do

	desc "Clear Hotspots from db"
	task :clear => [:environment] do
		Hotspot.delete_all
	end

  desc "Create Hotspot from Google Places search"
  task :gmap_create => [:environment] do

  	# initialize call_counter
  	call_counter = 0

  	# set types we're looking for
  	valid_types = %w{neighborhood political point_of_interest intersection natural_feature airport}

  	# load all stops
  	@stops = Stop.all

  	@stops.each do |stop|
  		# rubyio - singleton model
  		# gen model #run - make single model first time run, then refer to .first and give single attribute that's number

			# keep num of calls under API daily rate limit (1000)
	  	while call_counter < 950

		  	# place API call
		  	response = HTTParty.get(stop.place_query)

		  	places = JSON.parse(response.body)
		  	places = places["results"].to_a


		  	# for each place returned...
		  	places.each do |place|
	  			# if result has requested type, save to database
	  			unless (place["types"] & valid_types).empty?

	  				# look for existing hotspot with same gp_id
	  				hotspot = Hotspot.find_by(gp_id: place["id"])

	  				# if hotspot with same gp_id not in database, create new hotspot
	  				if hotspot == nil

	  					# convert types from array to string
	  					types_string = ""
	  					place["types"].each do |type|
	  						types_string += type
	  						types_string += " "
	  					end

	  					# create new Hotspot
		  				hotspot_new = Hotspot.new(
		  					hot_lat: place["geometry"]["location"]["lat"],
		  					hot_lng: place["geometry"]["location"]["lng"],
		  					name: place["name"],
		  					gp_id: place["id"],
		  					types: types_string,
		  					source: "google_places"
		  				)

		  				# associate with stop
		  				hotspot_new.stops << stop
		  				hotspot_new.save

	  				# if already in database, associate stop to existing hotspot
		  			else
		  				hotspot.stops << stop
		  				hotspot.save
		  			end
		  		end

			  end

	  		# add one to API counter
	  		call_counter += 1
		  end

	  	# wait 24 hours, reset counter and keep going
	  	sleep(1.day)
	  	call_counter = 0
	  end
  end

end
