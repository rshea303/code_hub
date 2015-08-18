require 'rails_helper'

describe "Favoriting a resource" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "creates a favorite for the signed-in user and shows the Unfave button" do
    resource = Resource.create!(resource_attributes)

    visit resource_url(resource)

    expect {
      click_button 'Add to favorites!'
    }.to change(@user.favorites, :count).by(1)

    expect(current_path).to eq(resource_path(resource))
    expect(page).to have_text("#{resource.name} has been added to your favorites!")
    expect(page).to have_button("Remove from favorites")
  end
end
