require 'rails_helper'

RSpec.feature "User submits a new artist" do
  let(:artist_name) { "Bob Marley" }
  let(:artist_image_path) {"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"}

  scenario "they enter data to create a new artist" do
    visit '/artists'
    click_on "New artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"

    expect(page).to have_content artist_name
    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
  context "the submitted data is invalid" do
    scenario "they forget to add artist name" do
      visit '/artists'
      click_on "New artist"
      fill_in "artist_image_path", with: artist_image_path

      click_on "Create Artist"
      
      expect(page).to have_content "Name can't be blank"
    end
  end
end
