require 'spec_helper'

describe Song do
  it { should respond_to(:lfid) }
  it { should respond_to(:amg) }
  it { should respond_to(:title) }
  it { should respond_to(:artist_name) }
  it { should respond_to(:score) }
  it { should respond_to(:context) }
  it { should respond_to(:snippet) }
  it { should respond_to(:rdio_id) }

	it { should have_and_belong_to_many(:hotspots) } 
	it { should have_and_belong_to_many(:playlists) } 
	xit { should have_and_belong_to_many(:stops) } 

	it { should validate_presence_of :lfid }
	it { should validate_presence_of :amg }
	it { should validate_presence_of :title }
	it { should validate_presence_of :artist_name }
	it { should validate_presence_of :score }
	it { should validate_presence_of :context }
end
