class AddCreateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :introduction, :text
    add_column :rooms, :total, :integer
    add_column :rooms, :address, :string
    add_column :rooms, :picture, :text
    add_column :rooms, :start_date, :date
    add_column :rooms, :end_date, :date
    add_column :rooms, :start_time, :datetime
    add_column :rooms, :user_id, :string
    add_column :rooms, :room_id, :string
    add_column :rooms, :single_rate, :integer
  end
end
