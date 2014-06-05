require 'spec_helper'

describe Song do
  it { should respond_to(:context) }
  it { should respond_to(:lfid) }
  it { should respond_to(:amg) }
  it { should respond_to(:title) }
  it { should respond_to(:artist_name) }
  it { should respond_to(:score) }
 
end
