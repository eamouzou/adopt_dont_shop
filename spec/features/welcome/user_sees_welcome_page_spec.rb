require 'rails_helper'

RSpec.describe "shelters welcome", type: feature do
  it "sees welcome message" do

    visit "/"

    expect(page).to have_content("Welcome to Adopt, Don't Shop!")
  end
end
