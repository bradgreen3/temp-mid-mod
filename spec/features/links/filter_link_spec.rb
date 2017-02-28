require "rails_helper"

describe "filter links", :js => :true do
  context "an authenticated user" do
    it "can filter by read links" do
      login_user
      user = User.find_by(email: "test@test.com")
      link = Link.create(title: "Turing", url: "http://www.turing.io", user_id: user.id, read: true)
      link2 = Link.create(title: "Google", url: "http://www.google.com", user_id: user.id, read: true)
      link3 = Link.create(title: "Yahoo", url: "http://www.yahoo.com", user_id: user.id, read: false)

      visit links_path
      click_on('Read')

      expect(page).to have_content("http://www.turing.io")
      expect(page).to have_content("http://www.google.com")
      expect(page).to_not have_content("http://www.yahoo.com")
    end
    it "can filter by unread links" do
      login_user
      user = User.find_by(email: "test@test.com")
      link = Link.create(title: "Turing", url: "http://www.turing.io", user_id: user.id, read: true)
      link2 = Link.create(title: "Google", url: "http://www.google.com", user_id: user.id, read: false)
      link3 = Link.create(title: "Yahoo", url: "http://www.yahoo.com", user_id: user.id, read: false)

      visit links_path
      click_on('Unread')

      expect(page).to have_content("http://www.yahoo.com")
      expect(page).to have_content("http://www.google.com")
      expect(page).to_not have_content("http://www.turing.io")
    end
  end
end
