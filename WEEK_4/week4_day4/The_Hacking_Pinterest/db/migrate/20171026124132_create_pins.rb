class CreatePins < ActiveRecord::Migration[5.1]
  def change
    create_table :pins do |t|
      t.string :title
      t.text :url
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
