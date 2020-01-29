require 'rails_helper'

RSpec.describe "create shelter", type:feature do
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

  it "can see and click on link to go to a form" do
    visit "/shelters"

    click_link("Create New Shelter")

    expect(current_path).to eq('/shelters/new')
  end

  it "can see form on shelters/new page" do
    visit "/shelters/new"

    # expect(page).to have_css('input[type="text"]')
    expect(page).to have_field('shelter_name')
    expect(page).to have_field('shelter_address')
    expect(page).to have_field('shelter_city')
    expect(page).to have_field('shelter_state')
    expect(page).to have_field('shelter_zip')
    expect(page).to have_button('Submit')
    save_and_open_page
  end
end
