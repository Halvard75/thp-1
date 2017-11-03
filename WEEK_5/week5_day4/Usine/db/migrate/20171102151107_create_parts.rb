class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.string :part_number
      t.references :assembly, foreign_key: true

      t.timestamps
    end
  end
end
