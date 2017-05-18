class Playlist < ApplicationRecord
  validates :name, presence: true

  has_many :playlist_songs
  has_many :songs, through: :playlist_songs

  def selected?(song)
    songs.include?(song)
  end
end
