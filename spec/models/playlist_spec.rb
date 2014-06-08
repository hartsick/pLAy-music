require 'spec_helper'

describe Playlist do
  it { should have_and_belong_to_many(:songs) }
  it { should have_and_belong_to_many(:routes) }
  it { should have_and_belong_to_many(:users) }
end
