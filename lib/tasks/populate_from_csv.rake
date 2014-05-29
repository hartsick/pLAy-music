# store csv info into psql
task :populate_from_csv, [:filename, :model] => [:environment] do |t, args|
	require 'csv'

	# clear previous data
	Module.const_get(args[:model]).delete_all
	
	# read lines from csv, create table headers from csv header
	lines = File.new(args[:filename]).readlines
	header = lines.shift.strip
	keys = header.split(',')
	
	# for each line, store value in relevant column
	lines.each do |line|
		values = line.strip.split(',')
		attributes = Hash[keys.zip values]
		Module.const_get(args[:model]).create(attributes)
	end
end