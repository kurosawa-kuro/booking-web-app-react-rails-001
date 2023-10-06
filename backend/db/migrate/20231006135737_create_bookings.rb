class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :from_date
      t.date :to_date
      t.integer :total_days
      t.decimal :total_amount
      t.string :status

      t.timestamps
    end
  end
end
