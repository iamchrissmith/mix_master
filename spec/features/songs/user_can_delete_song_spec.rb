require 'rails_helper'

RSpec.feature "User deletes a song" do
  let!(:song_1) { create(:song) }
  scenario "they delete a song" do
    visit songs_path

    expect(page).to have_content song_1.title

    click_on "Delete #{song_1.title}"

    expect(page).not_to have_content song_1.title
  end
end
