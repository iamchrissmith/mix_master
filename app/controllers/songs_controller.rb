class SongsController < ApplicationController
  before_action :set_song, only: [:show]
  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def show
    #code
  end

  private

   def song_params
     params.require(:song).permit(:title)
   end

   def set_song
     @song = Song.find(params[:id])
   end
end
