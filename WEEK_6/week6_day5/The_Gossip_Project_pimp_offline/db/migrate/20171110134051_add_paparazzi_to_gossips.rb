class AddPaparazziToGossips < ActiveRecord::Migration[5.1]
  def change
    add_column :gossips, :image, :string
  end
end
