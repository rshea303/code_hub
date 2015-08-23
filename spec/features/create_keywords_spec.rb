require 'rails_helper'

describe "Creating a keyword" do
  before do
    admin = User.create(user_attributes(admin: true))
    visit root_url
    sign_in(admin)
  end

  it "creates a new keyword in the database" do
    click_on("My Account")    
    click_on("Keywords")
    fill_in "keyword[name]", with: "SuperKeyword"

    expect {
      click_on("Create Keyword") 
    }.to change(Keyword, :count).by(1)

    expect(page).to have_text("SuperKeyword")
    
  end 
end
