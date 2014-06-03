require 'spec_helper'

describe SearchTerm do
  describe '#output' do
  	before { @st = SearchTerm.create!() }
  	it "should return 'json'" do
  		expect(@st.output).to eq('json')
  	end
  end
end
