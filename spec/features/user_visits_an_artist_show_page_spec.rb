require 'rails_helper'

RSpec.feature "User views a single artist" do
  before {
    Artist.create(name: "Bob Marley", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: "Bob Marley 2", image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
  }

  scenario "they visit the first artist's page" do
    visit '/artists'

    click_on "Bob Marley"

    expect(page).to have_content "Bob Marley"
    expect(page).to have_css("img[src=\"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg\"]")
    expect(page).to have_css("a[href=\"#{artists_path}\"]")
  end
end
