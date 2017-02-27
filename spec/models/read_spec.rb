require 'rails_helper'

RSpec.describe Read, type: :model do
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
end
