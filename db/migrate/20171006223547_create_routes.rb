class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :airline
      t.integer :airline_id
      t.string :source_airport
      t.integer :source_airport_id
      t.string :destination_airport
      t.integer :destination_airport_id
      t.string :codeshare
      t.string :stops
      t.string :equipment
      t.timestamps
    end
  end
end
