class Artists::SongsController < ApplicationController
  before_action :set_artist, only: [:new, :create, :index, :destroy]
  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def index
    @songs = @artist.songs.order(:title)
  end

  def destroy
    @artist.songs.find(params[:id]).destroy
    redirect_to artist_songs_path
  end

  private

   def song_params
     params.require(:song).permit(:title)
   end

   def set_artist
     @artist = Artist.find(params[:artist_id])
   end

end
