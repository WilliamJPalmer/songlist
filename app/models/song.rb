class Song < ActiveRecord::Base
  has_many :users
  has_many :playlists

  validates :title, presence: true, length: { minimum: 2 }
  validates :artist, presence: true, length: { minimum: 2 }
end
