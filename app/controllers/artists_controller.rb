class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]
  def index
  end

  def new
    @artist = Artist.new
  end

  def show
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  private

   def set_artist
     @artist = Artist.find(params[:id])
   end

   def artist_params
     params.require(:artist).permit(:name,:image_path)
   end
end
