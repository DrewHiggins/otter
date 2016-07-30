class BrothersController < ApplicationController
  def index
    @brothers = Brother.all
  end
end
