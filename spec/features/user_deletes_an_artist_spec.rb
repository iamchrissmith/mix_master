require 'rails_helper'

RSpec.feature "User deletes an artist" do
  let!(:artist_1) {
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  }
  let(:artist_2) {
    Artist.create(name: "Bob Marley 2", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  }

  scenario "they delete an artist" do
    visit artist_path(artist_2)

    click_on "Delete artist"

    expect(page).not_to have_content artist_2.name
    expect(page).to have_content artist_1.name
  end
end
