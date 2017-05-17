require 'rails_helper'

RSpec.feature "User creates a new playlist" do
  before {
    artist_1 = create(:artist)
    create_list(:song, 5, artist: artist_1)
    artist_2 = create(:artist)
    create_list(:song, 5, artist: artist_2)
  }
  scenario "they enter data to create a new playlist" do
    visit playlists_path
    songs_to_be_added = Song.all.take(3)
    click_on "New playlist"

    fill_in "playlist_name", with: "My Playlist"
    songs_to_be_added.each do |song|
      page.check(song.name)
    end
    click_on "Create Playlist"

    expect(page).to have_content "My Playlist"
    songs_to_be_added.each do |song|
      expect(page).to have_link song.name, href: song_path(song)
    end
    expect(page).not_to have_content Song.all[3].name
  end
end
