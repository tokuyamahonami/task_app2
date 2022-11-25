class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :people
      t.integer :total_price
      t.integer :total_day

      t.timestamps
    end
  end
end
