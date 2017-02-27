require 'rails_helper'

describe "when a guest goes to root page and clicks sign in" do
  context "they are redirected and can log in with their credentials" do
    before do
      user = User.create(email: "test@test.com", password: "pass", password_confirmation: "pass")
    end

    it "and be redirected to links index after logging in" do
      visit root_path
      click_on "Log In"
      fill_in "email", with: "test@test.com"
      fill_in "password", with: "pass"

      click_on "Submit"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Logged in!")

      end
      it "and cannot log in with incorrect password" do
        visit root_path
        click_on "Log In"
        fill_in "email", with: "test@test.com"
        fill_in "password", with: "password"

        click_on "Submit"

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Invalid credentials")
      end
      it "and cannot log in with invalid email" do
        visit root_path
        click_on "Log In"
        fill_in "email", with: "tester@test.com"
        fill_in "password", with: "pass"

        click_on "Submit"

        expect(current_path).to eq(login_path)
        expect(page).to have_content("Invalid credentials")
      end
    end
  end
