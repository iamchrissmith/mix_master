require 'rails_helper'

RSpec.feature "User Edits an existing song" do
  scenario "they enter new title for a song" do
    # artist = create(:artist)
    song = create(:song)
    artist = song.artist

    visit song_path(song)

    click_on "Edit song"

    fill_in "song_title", with: "New Title"

    click_on "Update Song"
    
    expect(page).to have_content "New Title"
    expect(page).to have_link artist.name, href: artist_path(artist)
    expect(page).to have_link "Edit song"
  end
end
