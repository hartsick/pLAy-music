require 'spec_helper'

describe LyricSearch do
	it "is invalid without a lyric" do
		st = LyricSearch.new
		expect(st).to be_invalid
	end

	describe 'relations: ' do
		xit { should have_many(:songs) }
	end

  describe 'preset fields:' do
  	before { @ls = LyricSearch.create!(lyrics: "do do do") }

  	it "#output should return 'json'" do
  		expect(@ls.output).to eq('json')
  	end

  	it "#reqtype should return 'default" do
  		expect(@ls.reqtype).to eq('default')
  	end

  	it "#searchtype should return 'track'" do
  		expect(@ls.searchtype).to eq('track')
  	end
  end
end
