require 'rails_helper'

describe "A review" do
  it "belongs to a resource" do
    resource = Resource.create(resource_attributes)
    review = resource.reviews.new(review_attributes)

    expect(review.resource).to eq(resource)
  end

  it "is not valid without a comment" do
    review = Review.new(review_attributes(comment: nil))

    expect(review).not_to be_valid
  end

  it "is not valid without a rating" do
    review = Review.new(review_attributes(rating: nil))

    expect(review).not_to be_valid
  end

  it "accepts rating values of 0 through 5" do
    ratings = [0, 1, 2, 3, 4, 5]

    ratings.each do |rating|
      review = Review.new(review_attributes(rating: rating))
      expect(review).to be_valid
    end
  end

  it "rejects a rating value greater than 5" do
    review = Review.new(review_attributes(rating: 6))

    expect(review).not_to be_valid
  end

  it "accepts a comment greater than 4 characters" do
    review = Review.new(review_attributes(comment: "a" * 10))

    expect(review).to be_valid
  end

  it "rejects a comment less than 4 characters" do
    review = Review.new(review_attributes(comment: "a" * 3))

    expect(review).not_to be_valid
  end

end
