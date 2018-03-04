class AddUserIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :userID, :integer
  end
end
