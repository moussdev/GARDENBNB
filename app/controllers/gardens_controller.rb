class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:garden_id])
  end

  def new
    @garden = Garden.new
  end
end
