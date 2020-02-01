require "rails_helper"

RSpec.describe 'update pet info', type:feature do
  before(:each) do
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
    shelter_name: @shelter1.name,
    description: "cuddly",
    adoption_status: "pending")
    @pet2 = Pet.create(image: pet2_path,
    name: "Shabba",
    approximate_age: 5,
    sex: "indigo",
    shelter_id: @shelter1.id,
    shelter_name: @shelter1.name,
    description: "grumpy",
    adoption_status: "adoptable")
  end

  scenario "see link to update on pet show page" do
    visit "/pets/#{@pet2.id}"

    expect(page). to have_link("Update #{@pet2.name}'s information!")
  end

  scenario "see form on pet edit page" do
    visit "/pets/#{@pet2.id}/edit"

    expect(page).to have_field('pet_image')
    expect(page).to have_field('pet_name')
    expect(page).to have_field('pet_description')
    expect(page).to have_field('pet_approximate_age')
    expect(page).to have_field('pet_sex')
  end

end
