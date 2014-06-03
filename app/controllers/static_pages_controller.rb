class StaticPagesController < ApplicationController
  def home
    @routes = Route.all
  end
end
