class ArtistsController < ApplicationController
  def index

  end

  def create
    @artist = Artist.new
  end
end
