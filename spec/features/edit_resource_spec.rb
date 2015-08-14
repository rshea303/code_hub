require 'rails_helper'

describe "Edit a resource" do
  before do
    @resource = Resource.create!(resource_attributes)
    
    visit resource_url(@resource)

    click_on("Edit")
  end

  it "can edit the name of a resource" do
    fill_in "resource[name]", with: "Updated Name"  
    click_on("Update")

    expect(page).to have_text("Updated Name")
    expect(page).to have_text("Resource successfully updated!")
  end 

  it "can edit the link of a resource" do
    fill_in "resource[link]", with: "http://updated.com"
    click_on("Update")

    resource = Resource.find(@resource.id)

    expect(resource.link).to eq("http://updated.com")
    expect(page).to have_text("Resource successfully updated!")
  end

end
