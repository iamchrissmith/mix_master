require 'rails_helper'

RSpec.feature "User Edits an existing song" do
  scenario "they enter new title for a song" do
    artist = create(:artist)
    song = create(:song)

    visit artist_songs_path(song)

    click_on "Edit song"

    fill_in "song_title", with: "New Title"

    click_on "Update Song"

    expect(page).to have_content "New Title"
    expect(page).to have_link "Edit song"
  end
end
