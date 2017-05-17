require 'rails_helper'

RSpec.feature "User views all songs" do
  context "when they view All Songs from artist page" do
    let!(:artist) { create(:artist)}
    let!(:song_1) { create(:song, artist: artist) }
    let!(:song_2) { create(:song, artist: artist) }

    scenario "they can see all of that Artist's songs" do
      visit artist_path(artist)
      click_on "View All Songs"

      expect(page).to have_content "All Songs for #{artist.name}"
      expect(page).to have_link song_1.title, href: song_path(song_1)
      expect(page).to have_link song_2.title, href: song_path(song_2)
    end
  end
end
