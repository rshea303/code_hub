require 'rails_helper'

describe "Signing in" do

  it "prompts for an email and password" do
    visit root_url

    click_link 'Sign In'

    expect(current_path).to eq(new_session_path)

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end

  it "signs in a registered user" do
    user = User.create(user_attributes(email: "user@example.com"))

    visit root_url
    click_on("Sign In")
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    within(".sign-in") do
      click_on("Sign In")
    end

    expect(page).to have_text("Welcome, #{user.name}")
  end

end
