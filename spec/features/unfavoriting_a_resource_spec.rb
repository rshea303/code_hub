require 'rails_helper'

describe "Unfavoriting a resource" do
  before do
    @user = User.create!(user_attributes)
    visit root_url
    sign_in(@user)
  end

  it "deletes the favorite and shows the Favorite button" do
    resource = Resource.create!(resource_attributes)

    visit resource_url(resource)
    click_button 'Add to favorites!'

    expect {
      click_button 'Remove from favorites'
    }.to change(@user.favorites, :count).by(-1)

    expect(current_path).to eq(resource_path(resource))

    expect(page).to have_text("Resource removed from favorites")
    expect(page).to have_button("Add to favorites!")
  end
end
