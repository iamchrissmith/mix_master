class ArtistsController < ApplicationController
  def index
  end

  def new
    @artist = Artist.new
  end
end
