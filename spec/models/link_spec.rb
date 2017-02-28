require 'rails_helper'

RSpec.describe Link, type: :model do
  it "is not created with missing suffix" do
    link = Link.new(url: 'www.test', title: 'Test')
    expect(link).to_not be_valid
  end
  it "is not created with missing suffix" do
    link = Link.new(url: 'http://test', title: 'Test')
    expect(link).to_not be_valid
  end
  it "is not created with missing prefix and suffix" do
    link = Link.new(url: 'test', title: 'Test')
    expect(link).to_not be_valid
  end
  it "is created with missing prefix" do
    link = Link.new(url: 'test.com', title: 'Test')
    expect(link).to be_valid
  end
  it "is created with http prefix" do
    link = Link.new(url: 'http://test.com', title: 'Test')
    expect(link).to be_valid
  end
  it "is created with www prefix" do
    link = Link.new(url: 'www.test.com', title: 'Test')
    expect(link).to be_valid
  end
  it "returns appropriate results by title" do
    link_1 = Link.create(title: "Google", url: "www.google.com")
    link_2 = Link.create(title: "Gong", url: "www.gong.com")
    link_3 = Link.create(title: "ZZZ", url: "www.zzz.com")

    results = Link.search("Go")

    expect(results.count).to eq(2)
    result.each do |result|
      expect(result.title).to_not eq("ZZZ")
    end
  end
end
