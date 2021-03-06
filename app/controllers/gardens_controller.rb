class GardensController < ApplicationController
  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @garden = Garden.new
  end

  def create
      @garden = Garden.new(garden_params)
      @garden.user = current_user
      # @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render "new"
    end
  end

    private

  def garden_params
      params.require(:garden).permit(:title, :image, :land, :price, :description, :address, :user_id)
    end
  end
