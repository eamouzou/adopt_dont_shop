require 'rails_helper'

RSpec.describe "create pet" do
  before(:each) do
    @shelter1 = Shelter.create(name: "Broke Down but Cute",
    address: "123456 E. Koko St.",
    city: "Aville",
    state: "CO",
    zip: "83504")
    @shelter2 = Shelter.create(name: "Are you lonely?",
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
    shelter_id: @shelter2.id,
    shelter_name: @shelter2.name,
    description: "cuddly",
    adoption_status: "pending")
    @pet2 = Pet.create(image: pet2_path,
    name: "Shabba",
    approximate_age: 5,
    sex: "indigo",
    shelter_id: @shelter2.id,
    shelter_name: @shelter2.name,
    description: "grumpy",
    adoption_status: "adoptable")
  end

  scenario "see and click on link in pets index" do
    visit "/shelters/#{@shelter2.id}/pets"

    click_link "Add Pet"

    expect(current_path).to eq("/shelters/#{@shelter2.id}/pets/new")
  end
end
