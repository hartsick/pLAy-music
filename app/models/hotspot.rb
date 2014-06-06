class Hotspot < ActiveRecord::Base
	has_and_belongs_to_many :stops
	has_and_belongs_to_many :songs

	validates_presence_of :hot_lat, :hot_lng, :name, :source, :has_generated_song
end
