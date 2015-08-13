require 'rails_helper'

describe "Deleting a resource" do
  it "destroys the movie and removes it from the database" do
    resource = Resource.create(resource_attributes)

    visit resource_url(resource)

    expect {
      click_on("Delete")
    }.to change(Resource.all, :count).by(-1)
  end
end
