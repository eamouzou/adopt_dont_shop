require 'rails_helper'

RSpec.describe "shelters index", type: feature do
  it "displays all shelter names" do
    shelter1 = Shelter.create(name: "Bloke",
    address: "123456 E. Koko St.",
    city: "Aville",
    state: "CO",
    zip: "83504")
    shelter2 = Shelter.create(name: "Stevie",
    address: "12765 E. Seesay St.",
    city: "Aville",
    state: "CO",
    zip: "83571")

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content("Street Address: #{shelter1.address}")
    expect(page).to have_content(shelter2.name)
    expect(page).to have_content("Street Address: #{shelter2.address}")
  end
end
