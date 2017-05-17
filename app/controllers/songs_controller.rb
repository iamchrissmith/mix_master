class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  private

   def song_params
     params.require(:song).permit(:title)
   end

   def set_song
     @song = Song.find(params[:id])
   end
end
