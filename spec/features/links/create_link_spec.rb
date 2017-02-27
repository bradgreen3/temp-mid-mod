require "rails_helper"

RSpec.describe "create links", :js => :true do
  scenario "an unauthenticated user" do
    it "cannot submit a link" do
      expect(page).to_not contain("Add Link")
    end
  end
  scenario "an authenticated user" do
    it "can add a link" do
      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"

      within('#links-list') do
        expect(page).to have_text("Turing")
        expect(page).to have_text("http://turing.io")
      end
    end
  end
