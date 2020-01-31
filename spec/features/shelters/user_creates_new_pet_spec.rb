require 'rails_helper'

RSpec.describe "create pet" do
  before(:each) do
  end

  scenario "see and click on link in pets index" do
    visit "/shelters/:shelter_id/pets"

    click_link "New Pet"

    expect(current_pat).to eq("/shelters/#{@shelter2.id}/pets/new")
  end
end
