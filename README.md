#Before starting app:#

###Download & unzip latest LA Metro GTFS data from:###

[http://developer.metro.net/introduction/gtfs-data/download-metros-gtfs-data/
](http://)

For the following files, change extension from txt to csv and save in the pLAy's lib/assets/ directory:

	routes.txt, stop_times.txt, stops.txt, trips.txt

###After running db:setup:###
	
#####Run:#####
*	rake populate_metro_data
*	rake aggregate_route_data
*	rake aggregate_stop_data
* 	rake associate_stops_to_route

