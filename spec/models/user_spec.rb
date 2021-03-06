require 'spec_helper'

describe User do
  it { should have_and_belong_to_many(:playlists) }
  it { should have_and_belong_to_many(:routes) }
  it { should have_and_belong_to_many(:users) }
end
