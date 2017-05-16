require 'rails_helper'

RSpec.feature "User views all artists" do
  before {
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: "Bob Marley 2", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  }

  scenario "they visit the index page" do
    visit '/artists'

    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("a[href=\"#{artist_path(Artist.first.id)}\"]")
    expect(page).to have_content "Bob Marley 2"
    expect(page).to have_css("a[href=\"#{artist_path(Artist.last.id)}\"]")
  end
end
