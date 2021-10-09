class AddStatusToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservations, :string
  end
end
