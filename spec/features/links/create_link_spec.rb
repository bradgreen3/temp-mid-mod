require "rails_helper"

describe "create links", :js => :true do
  context "an unauthenticated user" do
    it "cannot submit a link" do
      expect(page).to_not have_text("Add Link")
    end
  end
  context "an authenticated user" do
    it "can add a link" do
      login_user

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "http://turing.io"
      click_on "Add Link"

      within('#links-list') do
        expect(page).to have_text("Turing")
        expect(page).to have_text("http://turing.io")
      end
    end
    it "cannot see other user's link" do
      other_user = User.create(email: "brad@brad.com", password_digest: "pass")
      other_user_link = Link.create(title: "Other link", url: "http://other.com", read: false, user_id: other_user.id)
      test_user = login_user

      expect(page).to_not have_text("Other link")
      expect(page).to_not have_text("http://other.com")
    end
    it "cannot submit an invalid link" do
      login_user

      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "www.turing.io"
      click_on "Add Link"

      
    end
  end
end
