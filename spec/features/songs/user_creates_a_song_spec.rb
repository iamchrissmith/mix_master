require 'rails_helper'

RSpec.feature "User submits a new song" do
  let(:artist) {
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  }
  scenario "they enter data to create a new song" do
    visit artist_path(artist)

    click_on "New song"

    fill_in "song_title", with: "Song Title"
    click_on "Create Song"

    expect(page).to have_content "Song Title"
    expect(page).to have_current_path("/songs/1")
  end
end
