require 'rails_helper'

describe "an unauthenticated user" do
  context "visiting the root page" do
    it "can log in or sign up" do
      visit root_path

      expect(page).to have_link("Log In")
      expect(page).to have_link("Sign Up")
    end
  end
end
