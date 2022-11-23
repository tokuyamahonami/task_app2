class AddCreateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :introduction, :text
    add_column :rooms, :address, :string
  end
end
