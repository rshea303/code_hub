require 'rails_helper'

describe "Creating a user" do
  it "adds a new user to the database" do
    visit root_url

    click_on("Sign Up")

    fill_in "user[name]", with: "New User"
    fill_in "user[email]", with: "new_user@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on("Submit")

    expect(page).to have_text("Thank you for joining Code-Hub!")
    expect(page).to have_text("New User")
  end

  it "does not change user count if user is invalid" do
    visit root_url

    click_on("Sign Up")

    expect {
      click_on("Submit")
    }.not_to change(User, :count)
  end
end
