class Link < ApplicationRecord
  validates :url, :url => true
  
  def self.search(query)
    where(
    "upper(title) LIKE ? OR
    upper(url) LIKE ?",
    "%#{query.upcase}%",
    "%#{query.upcase}%")
  end

end
