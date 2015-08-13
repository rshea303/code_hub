require 'rails_helper'

describe "Viewing an individual resource" do
  it "shows the resource attributes" do
    resource = Resource.create(resource_attributes)

    visit resource_url(resource)

    expect(page).to have_text(resource.name)
    expect(page).to have_text(resource.rating)
    expect(page).to have_text(resource.description)
  end

  it "shows rating if value is greater than or equal to 3" do
    resource = Resource.create(resource_attributes(rating: 4))

    visit resource_url(resource)

    expect(page).to have_text(resource.rating)
  end

  it "shows 'Poor' if rating is below 3" do
    resource = Resource.create(resource_attributes(rating: 2))

    visit resource_url(resource)

    expect(page).to have_text('Poor')
  end
end
