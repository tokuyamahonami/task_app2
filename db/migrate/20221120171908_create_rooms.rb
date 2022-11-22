class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :area
      t.string :keyword

      t.timestamps
    end
  end
end
