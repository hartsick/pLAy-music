require 'spec_helper'

describe SearchTerm do
	it "is invalid without a lyric" do
		st = SearchTerm.new
		expect(st).to be_invalid
	end

	describe 'relations: ' do
		xit { should have_many(:songs) }
	end

  describe 'preset fields:' do
  	before { @st = SearchTerm.create!(lyrics: "do do do") }

  	it "#output should return 'json'" do
  		expect(@st.output).to eq('json')
  	end

  	it "#reqtype should return 'default" do
  		expect(@st.reqtype).to eq('default')
  	end

  	it "#searchtype should return 'track'" do
  		expect(@st.searchtype).to eq('track')
  	end
  end
end
