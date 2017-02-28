require "rails_helper"

describe "search box", :js => :true do
  context "an authenticated user" do
    it "can search for links" do
      login_user
      user = User.find_by(email: "test@test.com")
      link = Link.create(title: "Turing", url: "http://www.turing.io", user_id: user.id)
      link2 = Link.create(title: "Google", url: "http://www.googlez.com", user_id: user.id)
      link3 = Link.create(title: "Yahoo", url: "http://www.yahooz.com", user_id: user.id)

      visit links_path
      fill_in 'search-box', with: 'z'

      expect(page).to have_content("http://www.yahooz.com")
      expect(page).to have_content("http://www.googlez.com")
      expect(page).to_not have_content("http://www.turing.io")
    end
  end
end
