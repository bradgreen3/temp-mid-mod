class User < ApplicationRecord
  has_secure_password
  # validates :email, uniqueness: true
  validates_uniqueness_of :email, :presence => true, :case_sensitive => false
  validates :password, confirmation: true

end
