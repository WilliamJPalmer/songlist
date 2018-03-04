class CreateUserplaylists < ActiveRecord::Migration
  def change
    create_table :userplaylists do |t|
      t.references :user, index: true, foreign_key: true
      t.references :song, index: true, foreign_key: true
      t.integer :add

      t.timestamps null: false
    end
  end
end
