require 'rails_helper'

describe "Creating a resource" do
  it "creates a new resource in the database" do
    visit root_url

    click_on("Add New Resource")

    expect(current_path).to eq(new_resource_path)

    fill_in "resource[name]", with: "New Resource"
    fill_in "resource[link]", with: "http://newresource.com"
    fill_in "resource[rating]", with: 5
    click_on("Create")

    expect(page).to have_text("New Resource")
    expect(page).to have_text("5")
  end
end
