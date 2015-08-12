require 'rails_helper'

describe "Viewing an individual resource" do
  it "shows the resource attributes" do
    resource = Resource.create(name: "Resource 1", link: "http://resource1.com", rating: 3)

    visit resource_url(resource)

    expect(page).to have_text("Resource 1")
    expect(page).to have_text("3")
  end
end
