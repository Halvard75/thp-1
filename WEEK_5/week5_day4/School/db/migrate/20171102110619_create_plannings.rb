class CreatePlannings < ActiveRecord::Migration[5.1]
  def change
    create_table :plannings do |t|
      t.string :date
      t.references :student, foreign_key: true 
      t.references :classe, foreign_key: true

      t.timestamps
    end
  end
end
