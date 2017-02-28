require 'rails_helper'

RSpec.describe User, type: :model do
  describe "uniqueness" do
    subject { User.new(email: "brad@brad.com", password_digest: "pass", password_confirmation: "pass") }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_confirmation_of(:password) }
  end
end
