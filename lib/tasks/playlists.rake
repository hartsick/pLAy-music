namespace :playlists do

  desc "Delete all Playlists from database"
  task clear_all: :environment do

  	# reset hotspots
  	@routes = Route.where(has_generated_playlist: true)
  	@routes.each do |r|
  		r.has_generated_playlist = false
  		r.save
  	end

  	# delete existing songs
  	Playlist.delete_all
  end

  desc "Disassociate playlists from users"
  task clear_users: :environment do

  	# get all playlists
  	@playlists = Playlist.all

  	# reset hotspots
  	@routes = Route.where(has_generated_playlist: true)
  	@routes.each do |r|
  		r.has_generated_playlist = false
  		r.save
  	end
  end

  desc "Generate seed playlist for each route"
  task generate: :environment do

  	# pick set of unprocessed routes
   	@routes = Route.where(has_generated_playlist: false).limit(5)

   	# for each route
  	@routes.each do |route|

  		# create a new playlist, add songs for that route
  		@playlist = Playlist.new
			
			route.stops.each do |stop|
				stop.hotspots.each do |hotspot|
					hotspot.songs.each do |song|
						# only add new songs to playlist
						unless @playlist.songs.include? song
							@playlist.songs << song
						end
					end
				end
			end

			

			# update route
			route.has_generated_playlist = true
			route.save

			# assign playlist to random user (for testing)
			@user = User.order("RANDOM()").limit(1).first
			@playlist.users << @user
	  	
	  	# save it!
	  	@playlist.save

	  end
  end

end
