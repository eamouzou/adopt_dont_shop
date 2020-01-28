require 'rails_helper'

RSpec.describe "shelter id", type:feature do
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

  it "can see the shelter info that corresponds to that id" do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content("Name: #{@shelter1.name}")
    expect(page).to have_content("Address: #{@shelter1.address}")
    save_and_open_page
    expect(page).to have_content("City: #{@shelter1.city}")
    expect(page).to have_content("State: #{@shelter1.state}")
    expect(page).to have_content("Zip: #{@shelter1.zip}")
  end
end
