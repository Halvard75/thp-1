class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :flight_code
      t.integer :duration
      t.datetime :departure_date
      t.string :departure_airport
      t.string :arrival_airport
      t.integer :destination_id
      t.integer :origin_id


      t.timestamps
    end
  end
end
