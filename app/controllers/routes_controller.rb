class RoutesController < ApplicationController

  def index
    @routes = Route.all
    ###How to put in logic to access airline?
  end

  def show
  end

end
