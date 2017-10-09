class AddTypeIdToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :type_id, :integer
  end
end
