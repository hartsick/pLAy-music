require 'spec_helper'

describe StopsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    xit "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
