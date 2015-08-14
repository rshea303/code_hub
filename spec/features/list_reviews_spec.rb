require 'rails_helper'

describe "Viewing a list of reviews" do
  it "shows the reviews for a specific resource" do
    resource1 = Resource.create(resource_attributes(link: "http://resource1.com"))
    review1 = resource1.reviews.create(review_attributes)
    review2 = resource1.reviews.create(review_attributes(name: "Bob"))

    resource2 = Resource.create(resource_attributes(name: "Second Resource", link: "http://second.com"))
    review3 = resource2.reviews.create(review_attributes(name: "Steve"))
    review4 = resource2.reviews.create(review_attributes(name: "Jim"))

    visit resource_reviews_url(resource1)

    expect(page).to have_text(review1.name)
    expect(page).to have_text(review2.name)
    expect(page).not_to have_text(review3.name)
  end
end
