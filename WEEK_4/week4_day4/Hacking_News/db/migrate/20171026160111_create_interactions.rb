class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.text :body
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
end
