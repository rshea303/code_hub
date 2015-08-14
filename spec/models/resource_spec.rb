require 'rails_helper'

RSpec.describe Resource, type: :model do
  it "is poor if rating is less than 3" do
    resource = Resource.new(rating: 2)

    expect(resource.poor?).to eq(true)
  end

  it "is not valid without a name" do
    resource = Resource.new(resource_attributes(name: nil))

    expect(resource).not_to be_valid
  end

  it "is not valid without a link" do
    resource = Resource.new(resource_attributes(link: nil))

    expect(resource).not_to be_valid
  end

  it "is not valid without a rating" do
    resource = Resource.new(resource_attributes(rating: nil))

    expect(resource).not_to be_valid
  end

  it "is not valid without a description" do
    resource = Resource.new(resource_attributes(description: nil))

    expect(resource).not_to be_valid
  end
  
  RATINGS = (0..5)

  it "is valid with an integer rating from 0 to 5" do
    resource = Resource.new(resource_attributes(rating: 3))

    expect(resource).to be_valid
  end

  it "is not valid with a rating greater than 5" do
    resource = Resource.new(resource_attributes(rating: 7))

    expect(resource).not_to be_valid
  end
  
  it "is not valid with a rating less than 0" do
    resource = Resource.new(resource_attributes(rating: -3))

    expect(resource).not_to be_valid
  end

  it "is valid if description length no more than 200 characters" do
    resource = Resource.new(resource_attributes(description: "a" * 199))

    expect(resource).to be_valid
  end

  it "is not valid unless description length no greater than 200 characters" do
    resource = Resource.new(resource_attributes(description: "a" * 201))

    expect(resource).not_to be_valid
  end

  it "is not valid unless link is unique" do
    resource = Resource.create(resource_attributes(link: "http://EXAMPLE1.com"))
    resource2 = Resource.new(resource_attributes(link: "http://example1.com"))

    expect(resource2).not_to be_valid
  end

end
