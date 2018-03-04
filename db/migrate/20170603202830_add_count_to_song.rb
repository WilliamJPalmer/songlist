class AddCountToSong < ActiveRecord::Migration
  def change
    add_column :songs, :count, :integer
  end
end
