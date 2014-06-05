require 'spec_helper'

describe Hotspot do
  it { should respond_to(:hot_lat) }
  it { should respond_to(:hot_lng) }
  it { should respond_to(:name) }
  it { should respond_to(:gp_id) }
  it { should respond_to(:types) }

  it { should have_and_belong_to_many(:stops) }

  xit "should have a unique gp_id if gp_id exists" do
  end

end
