require "rails_helper"

describe "mark links as read", :js => :true do
  context "an authenticated user marking a link as read" do
    xit "sees read status change from false to true" do
      login_user
      link = Link.create(title: "Google", url: "www.google.com", user_id: User.first.id)

      visit root_path

      expect(page).to have_content("false")

      click_on("Mark as Read")

      expect(page).to have_content("true")
      expect(page).to_not have_content("false")
    end
  end
end
