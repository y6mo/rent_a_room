class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.text :address
      t.text :description
      t.float :price
      t.string :contact_info


      t.timestamps
    end
  end
end
