require 'json'

namespace :hotspots do

	desc "Delete all Hotspots from database"
	task :clear => [:environment] do
		Hotspot.delete_all
	end

  desc "Create Hotspot from Google Places search"
  task :gmap_create => [:environment] do

  	# set types we're looking for
  	valid_types = %w{neighborhood political point_of_interest intersection natural_feature airport}

  	# keep num of calls under API daily rate limit (1000)
  	@stops = Stop.where(has_generated_hotspot: false).limit(1000)

  	@stops.each do |stop|

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

  		# flag stop as processed
  		stop.has_generated_hotspot = true
  		stop.save

	  end
  end

end
