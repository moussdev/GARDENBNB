class RemoveReservationsFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :reservations, :string
  end
end
