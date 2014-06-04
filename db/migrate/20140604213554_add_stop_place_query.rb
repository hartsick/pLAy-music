class AddStopPlaceQuery < ActiveRecord::Migration
  def change
  	Stop.all.each do |s|
  		s.init
  		puts "Currently on: " + s.stop_name
  		puts "Query: " + s.place_query
  		s.save
  	end
  end
end
