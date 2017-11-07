class AddUsernameToMoussaillons < ActiveRecord::Migration[5.1]
  def change
    add_column :moussaillons, :anonymous_username, :string
  end
end
