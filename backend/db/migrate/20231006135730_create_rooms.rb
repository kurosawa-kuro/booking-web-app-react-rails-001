class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.integer :max_count
      t.string :phone_number
      t.decimal :rent_per_day
      t.string :room_type

      t.timestamps
    end
  end
end
