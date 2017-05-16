class ArtistsController < ApplicationController
  before_action :set_artist, only: [:new, :show]
  def index
  end

  def new
  end

  def show
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to @artist
  end

  private

   def set_artist
     @artist = Artist.new
   end

   def artist_params
     params.require(:artist).permit(:name,:image_path)
   end
end
