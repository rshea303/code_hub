require 'rails_helper'

describe "Viewing a list of reviews" do
  before do
    @user = User.create(user_attributes)
    visit root_url
    sign_in(@user)
  end 

  it "shows the reviews for a specific resource" do
    resource1 = Resource.create(resource_attributes(link: "http://resource1.com"))
    review1 = resource1.reviews.create(review_attributes(comment: "Boring", rating: 1, user: @user))
    review2 = resource1.reviews.create(review_attributes(comment: "Great", rating: 5, user: @user))

    resource2 = Resource.create(resource_attributes(name: "Second Resource", link: "http://second.com"))
    review3 = resource2.reviews.create(review_attributes(user: @user))

    visit resource_reviews_url(resource1)

    expect(page).to have_text(review1.comment)
    expect(page).to have_text(review2.comment)
    expect(page).not_to have_text(review3.comment)
  end
end
