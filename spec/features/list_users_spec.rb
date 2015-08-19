require 'rails_helper'

describe "Listing users" do
  it "displays the users" do
    user1 = User.create(user_attributes(email: "user1@example.com"))
    user2 = User.create(user_attributes(email: "user2@example.com"))
    user3 = User.create(user_attributes(email: "user3@example.com"))

    visit root_url
    sign_in(user1)

    visit users_url

    expect(page).to have_text(user1.name)
    expect(page).to have_text(user2.name)
    expect(page).to have_text(user3.name)
  end
end
