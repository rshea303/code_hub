require 'rails_helper'

describe "Signing in" do

  it "has fields for an email and password" do
    visit root_url

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end

  it "signs in a registered user" do
    user = User.create(user_attributes(email: "user@example.com"))
    
    visit root_url
    sign_in(user)

    expect(page).to have_text("Welcome, #{user.name}")
  end

  it "redirects to sign in page if email or password is invalid" do
    user = User.create(user_attributes(email: "user@example.com"))

    visit root_url
    fill_in "email", with: user.email
    fill_in "password", with: "incorrect_password" 
    click_on("Sign In")

    expect(page).to have_text("Invalid email/password combination")
    expect(current_path).to eq(root_path)
  end

  it "removes sign up when user is signed in" do
    user = User.create(user_attributes(email: "user@example.com"))
    
    visit root_url
    sign_in(user)

    expect(page).not_to have_text("Sign Up")
  end

  it "displays sign in and sign up links if sign in fails" do
    user = User.create(user_attributes(email: "user@example.com"))

    visit root_url
    fill_in "email", with: user.email
    fill_in "password", with: "incorrect_password" 
    click_on("Sign In")

    expect(page).to have_text("Sign Up")
  end

  it "redirects to the intended page" do
    user = User.create!(user_attributes)
    user2 = User.create!(user_attributes(email: "user2@example.com"))

    visit user_url(user2)

    expect(page).to have_text("Please sign in first")

    sign_in(user)

    expect(current_path).to eq(user_path(user2))
  end
end
