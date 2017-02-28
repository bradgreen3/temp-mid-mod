require 'rails_helper'

context "a not logged in user" do
  it "can create an account" do
    visit signup_path

    fill_in 'user_email', with: "brad@test.com"
    fill_in 'user_password', with: "pass"
    fill_in 'user_password_confirmation', with: "pass"

    click_button "Submit"

    expect(User.where(email: "brad@test.com")).to exist

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Account created!")

    end
  end
  context "a not logged in user" do
    it "cannot create account with email already in use" do

      User.create(email: "brad@test.com", password: "pass")

      visit signup_path

      fill_in 'user_email', with: "brad@test.com"
      fill_in 'user_password', with: "pass"
      fill_in 'user_password_confirmation', with: "pass"

      click_button "Submit"

      expect(current_path).to eq(signup_path)
      expect(page).to have_content("Email has already been taken")
    end
  end
  context "a not logged in user" do
    it "cannot create account with if password confirmation doesn't match password" do

      visit signup_path

      fill_in 'user_email', with: "brad@test.com"
      fill_in 'user_password', with: "pass"
      fill_in 'user_password_confirmation', with: "password"

      click_button "Submit"

      expect(current_path).to eq(signup_path)
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
