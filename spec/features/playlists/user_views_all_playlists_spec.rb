require 'rails_helper'

RSpec.feature "User visit playlist index" do
  let!(:playlist_1) { create(:playlist) }
  let!(:playlist_2) { create(:playlist) }
  let!(:playlist_3) { create(:playlist) }

  scenario "they can see each playlists' name and link" do
    visit playlists_path

    expect(page).to have_link playlist_1.name, href: playlist_path(playlist_1)
    expect(page).to have_link playlist_2.name, href: playlist_path(playlist_2)
    expect(page).to have_link playlist_3.name, href: playlist_path(playlist_3)
  end
end
