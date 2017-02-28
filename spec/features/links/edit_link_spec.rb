require "rails_helper"

describe "edit links", :js => :true do
  context "an authenticated user" do
    it "can edit link url" do

      login_user
      user = User.find_by(email: "test@test.com")
      link = Link.create(title: "Turing", url: "http://www.turing.io", user_id: user.id )

      visit links_path
      click_on('Edit')

      expect(current_path).to eq(edit_link_path(link))

      fill_in 'link_url', with: "http://turing.com"

      click_on('Submit')

      expect(current_path).to eq(links_path)
      expect(page).to have_content("http://turing.com")
      expect(page).to_not have_content("http://turing.io")
    end
  end
  context "an authenticated user" do
    it "can edit link title" do
      login_user
      user = User.find_by(email: "test@test.com")
      link = Link.create(title: "Turing", url: "http://www.turing.io", user_id: user.id )

      visit links_path
      click_on('Edit')

      expect(current_path).to eq(edit_link_path(link))

      fill_in 'link_title', with: "Homepage"

      click_on('Submit')

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Homepage")
      expect(page).to_not have_content("Turing")
    end
    it "cannot submit an invalid link" do
      login_user
      user = User.find_by(email: "test@test.com")
      link = Link.create(title: "Turing", url: "http://www.turing.io", user_id: user.id )

      visit links_path
      click_on('Edit')

      expect(current_path).to eq(edit_link_path(link))

      fill_in 'link_url', with: "turingio"

      click_on('Submit')

      expect(current_path).to eq(link_path(link))
      expect(page).to have_text("Url is an invalid URL")
    end
  end
end
