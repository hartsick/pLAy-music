class LyricSearch < ActiveRecord::Base
	validates_presence_of :lyrics
	belongs_to :stop

	# set constants for queries
	def output
		'json'
	end

	def reqtype
		'default'
	end

	def searchtype
		'track'
	end

	# temporarily cap number of results returned
	def limit
		'10'
	end

end
