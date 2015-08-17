require 'rails_helper'

describe "Deleting a resource" do

  before do
    admin = User.create!(user_attributes(admin: true))
    sign_in(admin)
  end

  it "destroys the movie and removes it from the database" do
    resource = Resource.create(resource_attributes)

    visit resource_url(resource)

    expect {
      click_on("Delete")
    }.to change(Resource.all, :count).by(-1)
    expect(page).to have_text("Resource successfully destroyed!")
  end
end
