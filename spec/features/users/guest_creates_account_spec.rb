require 'rails_helper'

context "a not logged in user" do
  it "can create an account" do
    visit signup_path

    fill_in 'user_email', with: "brad@test.com"
    fill_in 'user_password', with: "pass"
    fill_in 'user_password_confirmation', with: "pass"

    click_button "Submit"

    User.where(email: "brad@test.com").should exist

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Account created!")

    end
  end
