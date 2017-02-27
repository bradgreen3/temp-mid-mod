require 'rails_helper'

describe "As a logged in user visiting the links index page" do
  it "I should see a sign out button but not a sign in button" do
    login_user

    expect(page).to have_content("Log Out")
    expect(page).to_not have_content("Sign In")
  end
  it "I should be able to logout" do
    login_user
    click_on "Log Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Log In")
    expect(page).to_not have_content("Log Out")
  end
end
