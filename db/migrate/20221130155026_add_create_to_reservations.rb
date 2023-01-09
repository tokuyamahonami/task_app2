class AddCreateToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_id, :string
    add_column :reservations, :user_id, :string
    add_column :reservations, :name, :string
    add_column :reservations, :single_rate, :integer
  end
end
