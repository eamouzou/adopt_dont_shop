require 'rails_helper'

RSpec.describe "update shelter", type:feature do
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

  it "can see and click on link to update form" do
    visit "/shelters/#{@shelter2.id}"

    click_link("Update Shelter")

    expect(current_path).to eq("/shelters/#{@shelter2.id}/edit")
  end

  it "can see form on edit page" do
    visit "/shelters/#{@shelter2.id}/edit"

    expect(page).to have_field('shelter_name')
    expect(page).to have_field('shelter_address')
    expect(page).to have_field('shelter_city')
    expect(page).to have_field('shelter_state')
    expect(page).to have_field('shelter_zip')
    expect(page).to have_button('Submit')
  end

  it "can fill out/submit form and see updated info on shelter show page" do
    visit "/shelters/#{@shelter2.id}/edit"

    fill_in "shelter_name", with: "Updated"
    fill_in "shelter_address", with: "Updated St."
    fill_in "shelter_city", with: "Updated City"
    fill_in "shelter_state", with: "CO"
    fill_in "shelter_zip", with: "80309"
    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter2.id}")
    expect(page).to have_content("Updated")
    expect(page).to have_content("Updated St.")
    expect(page).to have_content("Updated City")
    expect(page).to have_content("CO")
    expect(page).to have_content("80309")
  end
end
