namespace :songs do

  desc "Delete all Songs from database"
  task clear: :environment do

  	# reset hotspots
  	@hotspots = Hotspot.where(has_generated_song: true)
  	@hotspots.each do |hs|
  		hs.has_generated_song = false
  		hs.save
  	end

  	# delete existing songs
  	Song.delete_all
  end

  desc "Create Songs from running Hotspots through LyricFind Search API"
  task load: :environment do
   	# keep num of calls under API daily rate limit (1000)
   	@hotspots = Hotspot.where(has_generated_song: false).limit(100)

  	@hotspots.each do |hotspot|
  		# build API request
			base_uri = "http://test.lyricfind.com/api_service/search.do?"
			search_uri = ""

			# set required fields
			search_fields = Hash.new
			search_fields["apikey"] = ENV['PLAY_LYRICSEARCH_KEY']
			search_fields["reqtype"] = "default"
			search_fields["searchtype"] =  "track"
			search_fields["lyrics"] = hotspot.name
			search_fields["limit"] = '50'
			search_fields["alltracks"] = 'yes'
			search_fields["output"] = 'json'

			# format hash key & values for url, compile
			search_uri = search_fields.to_query

			# assemble final url for API call 
			url = base_uri + search_uri

			puts "Calling " + hotspot.name + " at: " + url

	  	# place API call
	  	response = HTTParty.get(url)
	  	response_body = JSON.parse(response.body)
	  	songs = response_body["tracks"].to_a

	  	# for each track returned...
	  	songs.each do |song|

	  		# skip song if search string is found in artist name or score is lower than .5
	  		unless song['artist']['name'].include? hotspot.name || song['score'] < 0.5

	  			# check database for song with existing lfid, amg, or artist & title
	  			dupe_check = [
	  				@dupe_amg = Song.find_by(amg: song['amg']),
	  				@dupe_lfid = Song.find_by(lfid: song['lfid']),
	  				@dupe_title = Song.find_by(title: song['title']),
	  				@dupe_artist = Song.find_by(artist_name: song['artist']['name'])
	  			]
	  			dupe_exists = dupe_check[0] || dupe_check[1] || (dupe_check[2] && dupe_check[3])

	  			# initialize dupe
	  			dupe = nil

	  			# if duplicate found, store the duplciate value
	  			if dupe_exists
	  				puts "Dupe exists!"
		  			while dupe.nil? 
			  			# check database for song with existing lfid, amg, or artist & title
				  		dupe_check.each do |d|
				  			if d
				  				dupe = d
				  				puts "Dupe is: " + dupe.title
				  			end
				  		end
				  		break
				  	end
				  end

					# if no song entry exists in db with same amg, lfid, or artist & title make a new song
					unless dupe
						puts "New song... Skipping for now!"

						# create new Song
	  				song_new = Song.new(
	  					lfid: song['lfid'],
	  					amg: song['amg'],
	  					instrumental: song['instrumental'],
	  					viewable: song['viewable'],
	  					has_lrc: song['has_lrc'],
	  					title: song['title'],
	  					artist_name: song['artist']['name'],
	  					snippet: song['snippet'],
	  					context: song['context'],
	  					last_update: song['last_update'],
	  					score: song['score']
	  				)

	  				# associate hotspot with song
	  				song_new.hotspots << hotspot
	  				song_new.save

					# if already in database, associate song to existing hotspot
	  			else
	  				puts "Found a dupe for: #{song['artist']['name']} '#{song['title']}'"
	  				dupe.hotspots << hotspot
	  				dupe.save
	  			end

	  		end
		  end

  		# # flag hotstop as processed
  		hotspot.has_generated_song = true
  		hotspot.save

	  end
  end

end
