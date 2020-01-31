require 'rails_helper'

RSpec.describe "pets index", type:feature do
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

    pet1_path = "https://imgix.bustle.com/uploads/getty/2019/11/18/6296727a-d38c-40b4-8ffe-dbec5cd1b289-getty-954967324.jpg?w=1020&h=576&fit=crop&crop=faces&auto=format&q=70"
    pet2_path = "https://images-ra.adoptapet.com/images/Homepage-DogV2.png"

    @pet1 = Pet.create(image: pet1_path,
    name: "Patra",
    approximate_age: 2,
    sex: "free",
    shelter_id: @shelter1.id,
    shelter_name: @shelter1.name)
    @pet2 = Pet.create(image: pet2_path,
    name: "Shabba",
    approximate_age: 5,
    sex: "indigo",
    shelter_id: @shelter1.id,
    shelter_name: @shelter1.name)
  end

  scenario "sees link for and can click to pets page" do
    visit "/shelters/#{@shelter1.id}"

    click_link("Pets")

    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")
  end

  scenario "sees all pet information on shelter's pets page" do
    visit "/shelters/#{@shelter1.id}/pets"

    expect(page).to have_content('All Pets for "Bloke" Shelter')
    expect(page).to have_css("img[src*='#{@pet1.image}']")
    expect(page).to have_content("Patra")
    expect(page).to have_content(2)
    expect(page).to have_content("free")
    expect(page).to have_css("img[src*='#{@pet2.image}']")
    expect(page).to have_content("Shabba")
    expect(page).to have_content(5)
    expect(page).to have_content("indigo")
  end

end
