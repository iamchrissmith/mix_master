require 'rails_helper'

RSpec.feature "User Edits an existing artist" do
  let(:artist) {
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  }
  scenario "they enter new name for an artist" do
    visit "#{artist_path(artist)}"

    click_on "Edit artist"

    fill_in "artist_name", with: "Bobby"

    click_on "Update Artist"

    expect(page).to have_content "Bobby"
    expect(page).to have_css("img[src=\"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg\"]")
  end

  scenario "they enter new image for an artist" do
    visit "#{artist_path(artist)}"

    click_on "Edit artist"

    fill_in "artist_image_path", with: "http://www.villages-news.com/wp-content/uploads/2016/10/Bob-Marley.jpg"
    click_on "Update Artist"

    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src=\"http://www.villages-news.com/wp-content/uploads/2016/10/Bob-Marley.jpg\"]")
  end
end
