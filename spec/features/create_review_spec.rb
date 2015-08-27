require 'rails_helper'

describe "Creating a new review" do

  before do 
    @user = User.create(user_attributes)
    visit root_url
    sign_in(@user)
  end

  it "saves the review" do
    resource = Resource.create(resource_attributes)

    visit resource_path(resource)
    click_on("write a review")

    expect(current_path).to eq(new_resource_review_path(resource))
    
    fill_in "Comment", with: "Best resource in the world for Ruby"
    fill_in "Rating", with: 4

    click_button('Post Review')

    expect(current_path).to eq(resource_path(resource))
    expect(page).to have_text("Thanks for your review!")
    expect(page).to have_text("Best resource in the world for Ruby")
    expect(page).to have_text(@user.name)
  end

end 
