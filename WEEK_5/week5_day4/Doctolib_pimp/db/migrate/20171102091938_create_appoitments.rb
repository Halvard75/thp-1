class CreateAppoitments < ActiveRecord::Migration[5.1]
  def change
    create_table :appoitments do |t|
      t.string :date
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
