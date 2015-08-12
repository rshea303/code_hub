require 'rails_helper'

describe "Navigating resources" do
  it "allows navigation from the detail page to the listing page" do
    resource = Resource.create(resource_attributes)

    visit resource_url(resource)
    click_on("All Resources")

    expect(current_path).to eq(resources_path)
  end

  it "allows navigation from the listing page to the detail page" do
    resource = Resource.create(resource_attributes)

    visit resources_url
    click_on("New Resource")

    expect(current_path).to eq(resource_path(resource))
  end
end
