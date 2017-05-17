require 'rails_helper'

RSpec.feature "User deletes a song" do
  context "when the user views song list of a specific artist" do
    let!(:artist) { create(:artist)}
    let!(:song_1) { create(:song, title: "Song 1", artist: artist) }
    let!(:song_2) { create(:song, title: "Song 2", artist: artist) }

    scenario "they delete a song" do
      visit artist_songs_path(artist)

      expect(page).to have_link song_1.title, href: song_path(song_1)

      click_on "Delete #{song_1.title}"

      expect(page).not_to have_content song_1.title
      expect(page).to have_content "All Songs for #{artist.name}"
      expect(page).to have_link song_2.title, href: song_path(song_2)
    end
  end
end
