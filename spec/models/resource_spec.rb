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
    resource.reviews.create(review_attributes(name: "Review 1"))
    resource.reviews.create(review_attributes(name: "Review 2"))
    resource.reviews.create(review_attributes(name: "Review 3"))

    expect(resource.reviews.count).to eq(3)
  end

  it "deletes associated reviews" do
    resource = Resource.create(resource_attributes(link: "http://EXAMPLE1.com"))
    resource.reviews.create(review_attributes(name: "Review 1"))
    resource.reviews.create(review_attributes(name: "Review 2"))
    resource.reviews.create(review_attributes(name: "Review 3"))

    expect {
      resource.destroy
    }.to change(Review, :count).by(-3)
  end

end
