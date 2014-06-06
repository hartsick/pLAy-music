require 'spec_helper'

describe Hotspot do
  it { should respond_to(:hot_lat) }
  it { should respond_to(:hot_lng) }
  it { should respond_to(:name) }
  it { should respond_to(:gp_id) }
  it { should respond_to(:types) }
  it { should respond_to(:has_generated_song) }

  it { should have_and_belong_to_many(:stops) }
  it { should have_and_belong_to_many(:songs)}

  it { should validate_presence_of(:hot_lng) }
  it { should validate_presence_of(:hot_lat) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:source) }
  it { should validate_presence_of(:has_generated_song) }

  xit "should have a unique gp_id if gp_id exists" do
  end

  it ".has_generated_hotspot should default to false" do
  	@hotspot = Hotspot.new
  	expect(@hotspot.has_generated_song).to eq(false)
  end

end
