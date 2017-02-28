class Link < ApplicationRecord
  validates :url, :url => true
  validates_presence_of :title

  def self.search(query)
    where(
    "upper(title) LIKE ? OR
    upper(url) LIKE ?",
    "%#{query.upcase}%",
    "%#{query.upcase}%")
  end

end
