require 'rails_helper'

describe "Editing a keyword" do
  it "can update the keyword name" do
    admin = User.create!(user_attributes(email: "admin@example.com", admin: true))
    keyword = Keyword.create!(name: "keyword")

    visit root_url
    sign_in(admin)
    visit keywords_url 
    click_on "Edit"
    fill_in "keyword[name]", with: "UpdatedKeywordName"
    click_on "Update"

    expect(page).to have_text("UpdatedKeywordName")
  end
end
