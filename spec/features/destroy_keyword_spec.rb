require 'rails_helper'

describe "Deleting a keyword" do
  it "removes keywords form the database" do
    admin = User.create!(user_attributes(email: "admin@example.com", admin: true))
    keyword = Keyword.create!(name: "Test")

    visit root_url
    sign_in(admin)
    visit keywords_url 

    expect {
      click_on "Delete"
    }.to change(Keyword, :count).by(-1)
  end
end
