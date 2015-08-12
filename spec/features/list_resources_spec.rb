require 'rails_helper'

describe "Viewing the list of resources" do
  it "shows the resources" do
    visit resources_url 

    expect(page).to have_text("3 Resources")
    expect(page).to have_text("Resource 1")
    expect(page).to have_text("Resource 2")
    expect(page).to have_text("Resource 3")
  end

end

