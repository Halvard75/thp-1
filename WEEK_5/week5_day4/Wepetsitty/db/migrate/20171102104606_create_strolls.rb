class CreateStrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :strolls do |t|
      t.string :date
      t.references :dogsitter, foreign_key: true
      t.references :dogs, foreign_key: true

      t.timestamps
    end
  end
end
