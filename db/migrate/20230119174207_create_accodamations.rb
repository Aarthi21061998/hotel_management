class CreateAccodamations < ActiveRecord::Migration[7.0]
  def change
    create_table :accodamations do |t|
      t.string :room_type
      t.integer :room_number
      t.string  :parking_type
      t.string :food_acc
      t.string  :offer
      t.references :hotel, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
