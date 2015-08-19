require 'rails_helper'

describe "Creating a resource" do
  before do
    @keyword1 = Keyword.create!(name: "rails")
    @keyword2 = Keyword.create!(name: "ruby")
    @keyword3 = Keyword.create!(name: "javascript")
  end

  it "creates a new resource in the database" do
    user = User.create(user_attributes)

    visit root_url
    sign_in(user)

    click_on("Add New Resource")

    expect(current_path).to eq(new_resource_path)

    fill_in "resource[name]", with: "New Resource"
    fill_in "resource[description]", with: "A great resource to learn ruby and rails.  It includes videos and guided tutorials"
    fill_in "resource[link]", with: "http://newresource.com"
    check(@keyword1.name)
    check(@keyword2.name)
    click_on("Create")

    expect(page).to have_text("New Resource")
    expect(page).to have_text("Resource successfully created!")
    expect(page).to have_text(@keyword1.name)
    expect(page).to have_text(@keyword2.name)
    expect(page).not_to have_text(@keyword3.name)
  end
end
