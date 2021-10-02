class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden_id = Garden_id.new
  end

  def new
    @garden = Garden.new
  end
end
