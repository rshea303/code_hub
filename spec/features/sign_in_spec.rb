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

    sign_in(user)

    expect(page).to have_text("Welcome, #{user.name}")
  end

  it "redirects to sign in page if email or password is invalid" do
    user = User.create(user_attributes(email: "user@example.com"))

    visit root_url
    click_on("Sign In")
    fill_in "email", with: user.email
    fill_in "password", with: "incorrect_password" 
    within(".sign-in") do
      click_on("Sign In")
    end

    expect(page).to have_text("Invalid email/password combination")
    expect(current_path).to eq(sign_in_path)
  end

  it "removes sign in and sign up links when user is signed in" do
    user = User.create(user_attributes(email: "user@example.com"))

    sign_in(user)

    expect(page).not_to have_text("Sign In")
    expect(page).not_to have_text("Sign Up")
  end

  it "displays sign in and sign up links if sign in fails" do
    user = User.create(user_attributes(email: "user@example.com"))

    visit root_url
    click_on("Sign In")
    fill_in "email", with: user.email
    fill_in "password", with: "incorrect_password" 
    within(".sign-in") do
      click_on("Sign In")
    end

    expect(page).to have_text("Sign In")
    expect(page).to have_text("Sign Up")
  end

  it "redirects to the intended page" do
    user = User.create!(user_attributes)

    visit users_url

    expect(current_path).to eq(new_session_path)

    sign_in(user)

    expect(current_path).to eq(users_path)
  end
end
