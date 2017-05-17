require 'rails_helper'

RSpec.feature "User views all songs" do
  context "they view songs index without an artist id" do
    let!(:song_1) { create(:song, title: "Song 1") }
    let!(:song_2) { create(:song, title: "Song 2") }

    scenario "they can see all the songs" do
      visit songs_path

      expect(page).to have_link song_1.title, href: song_path(song_1)
      expect(page).to have_link song_2.title, href: song_path(song_2)
    end
  end
end
