class CreateAirports < ActiveRecord::Migration[5.0]
  def change
    create_table :airports do |t|
      t.integer :airport_id
      t.string :name
      t.string :city
      t.string :country
      t.string :iata
      t.string :icao
      t.float :latitude
      t.float :longitude
      t.integer :altitude
      t.integer :timezone
      t.string :dst
      t.string :tz_db_timezone
      t.string :type
      t.string :source
      t.timestamps
    end
  end
end
