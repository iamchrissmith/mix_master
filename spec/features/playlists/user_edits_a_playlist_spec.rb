require 'rails_helper'

RSpec.feature "User edits a playlist" do
  let!(:playlist_1) { create(:playlist_with_songs) }
  let!(:unselected_song) { create(:song, title: "Unselected") }

  scenario "they can change playlist name, and add and remove songs" do
    new_name = "My New Playlist Name"
    visit playlist_path(playlist_1)

    click_on "Edit"

    to_be_unselected = playlist_1.songs.first

    fill_in "playlist_name", with: new_name
    page.check("song-#{unselected_song.id}")
    page.uncheck("song-#{to_be_unselected.id}")

    click_on "Update Playlist"

    expect(page).to have_content new_name
    expect(page).to have_content unselected_song.title
    expect(page).not_to have_content to_be_unselected.title

    save_and_open_page

  end
end
