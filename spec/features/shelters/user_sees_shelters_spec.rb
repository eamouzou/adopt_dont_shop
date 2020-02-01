require 'rails_helper'

RSpec.describe "shelters index", type: feature do
  before :each do
    @shelter1 = Shelter.create(name: "Bloke",
    address: "123456 E. Koko St.",
    city: "Aville",
    state: "CO",
    zip: "83504")
    @shelter2 = Shelter.create(name: "Stevie",
    address: "12765 E. Seesay St.",
    city: "Aville",
    state: "CO",
    zip: "83571")
  end

  it "displays all shelter names" do
    visit "/shelters"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
  end

  scenario "sees edit shelter link" do
    visit "/shelters"
    link1 = "/shelters/#{@shelter1.id}/edit"
    link2 = "/shelters/#{@shelter2.id}/edit"

    expect(page).to have_link("Edit #{@shelter1.name}", href: link1)
    expect(page).to have_link("Edit #{@shelter2.name}", href: link2)
  end

  scenario "can click link and go to edit page" do
    visit "/shelters"
    link1 = "/shelters/#{@shelter1.id}/edit"
    click_link("Edit #{@shelter1.name}")

    expect(current_path).to eq(link1)
  end
end
