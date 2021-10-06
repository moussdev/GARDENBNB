class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    @garden = Garden.find(params[:garden_id])
    @reservation.garden = @garden
    @reservation.user = current_user
    days = (@reservation.date_end.to_date - @reservation.date_start.to_date).to_i
    price = @garden.price
    # Créer une méthode de pricing degréssive
    @reservation.price_final = days * price
    if @reservation.save
      redirect_to garden_path(@garden)
    else
      render "gardens/show"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date_start, :date_end)
  end
end
