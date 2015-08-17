require 'rails_helper'

describe "Creating a resource" do

  it "creates a new resource in the database" do
    user = User.create(user_attributes)
    sign_in(user)

    visit root_url

    click_on("Add New Resource")

    expect(current_path).to eq(new_resource_path)

    fill_in "resource[name]", with: "New Resource"
    fill_in "resource[description]", with: "A great resource to learn ruby and rails.  It includes videos and guided tutorials"
    fill_in "resource[link]", with: "http://newresource.com"
    click_on("Create")

    expect(page).to have_text("New Resource")
    expect(page).to have_text("Resource successfully created!")
  end
end
