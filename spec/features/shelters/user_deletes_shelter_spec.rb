# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter

require 'rails_helper'

RSpec.feature "delete shelter", type:feature do
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

  scenario "see and click link that deletes shelter" do
    visit "/shelters"
    link1 = "/shelters/#{@shelter1.id}"

    expect(page).to have_link("Bloke", href: link1)

    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content("Bloke")
    expect(page).to have_content("123456 E. Koko St.")
    expect(page).to have_content("Aville")
    expect(page).to have_content("CO")
    expect(page).to have_content("83504")

    click_link("Delete Shelter")

    expect(current_path).to eq("/shelters")
    expect(page).not_to have_link("Bloke")
  end
end
