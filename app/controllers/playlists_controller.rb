class PlaylistsController < ApplicationController
  def index
    # @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
    @songs = Song.all
  end
end
