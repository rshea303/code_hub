require 'rails_helper'

describe "Edit a resource" do
  before do
    @resource = Resource.create!(resource_attributes)
    
    visit resource_url(@resource)

    click_on("Edit")
  end

  it "can edit the name of a resource" do
    fill_in "name", with: "Updated Name"  
    click_on("Update")

    expect(page).to have_text("Updated Name")
  end 

  it "can edit the link of a resource" do
    fill_in "link", with: "http://updated.com"
    click_on("Update")

    resource = Resource.find(@resource.id)

    expectd(resource.link).to eq("http://updated.com")
  end

  it "can edit the rating of a resource" do
    fill_in "rating", with: 0
    click_on("Update")

    expect(page).to have_text("0")
  end
end
