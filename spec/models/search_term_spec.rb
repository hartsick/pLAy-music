require 'spec_helper'

describe SearchTerm do
  describe 'preset fields:' do
  	before { @st = SearchTerm.create!() }
  	
  	it "#output should return 'json'" do
  		expect(@st.output).to eq('json')
  	end

  end
end
