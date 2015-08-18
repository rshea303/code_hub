require 'rails_helper'

RSpec.describe Resource, type: :model do

  it "is not valid without a name" do
    resource = Resource.new(resource_attributes(name: nil))

    expect(resource).not_to be_valid
  end

  it "is not valid without a link" do
    resource = Resource.new(resource_attributes(link: nil))

    expect(resource).not_to be_valid
  end

  it "is not valid without a description" do
    resource = Resource.new(resource_attributes(description: nil))

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

  it "has many reviews" do
    resource = Resource.create(resource_attributes(link: "http://EXAMPLE1.com"))
    resource.reviews.create(review_attributes)
    resource.reviews.create(review_attributes)
    resource.reviews.create(review_attributes)

    expect(resource.reviews.count).to eq(3)
  end

  it "deletes associated reviews" do
    resource = Resource.create(resource_attributes(link: "http://EXAMPLE1.com"))
    resource.reviews.create(review_attributes)
    resource.reviews.create(review_attributes)
    resource.reviews.create(review_attributes)

    expect {
      resource.destroy
    }.to change(Review, :count).by(-3)
  end

  it "calculates the average rating" do
    resource = Resource.create(resource_attributes)

    resource.reviews.create(review_attributes(rating: 1))
    resource.reviews.create(review_attributes(rating: 2))
    resource.reviews.create(review_attributes(rating: 4))
    resource.reviews.create(review_attributes(rating: 5))

    expect(resource.average_rating.to_s).to eq("3.0")
  end

  it "has fans" do
    resource = Resource.new(resource_attributes)
    fan1 = User.new(user_attributes(email: "fan1@example.com"))
    fan2 = User.new(user_attributes(email: "fan2@example.com"))

    resource.favorites.new(user: fan1)
    resource.favorites.new(user: fan2)

    expect(resource.fans).to include(fan1)
    expect(resource.fans).to include(fan2)
  end
end
