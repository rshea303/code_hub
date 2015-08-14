require 'rails_helper'

describe "Viewing an individual resource" do
  it "shows the resource attributes" do
    resource = Resource.create(resource_attributes)

    visit resource_url(resource)

    expect(page).to have_text(resource.name)
    expect(page).to have_text(resource.description)
  end

end
