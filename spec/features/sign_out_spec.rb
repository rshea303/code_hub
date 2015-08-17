require 'rails_helper'

describe "Signing out a user" do
  it "removes the user id from the session" do
    user = User.create(user_attributes)

    sign_in(user)

    click_on("Sign Out")

    expect(page).to have_text("Come back soon!")
    expect(page).to have_text("Sign In")
    expect(page).not_to have_text("Sign Out")
  end
  
end
