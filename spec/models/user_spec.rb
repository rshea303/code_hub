require 'rails_helper'
require 'spec_helper'

describe "A user" do

  it "requires a name" do
    user = User.new(name: "")

    expect(user).not_to be_valid
  end

  it "requires an email" do
    user = User.new(email: "")

    expect(user).not_to be_valid
  end

  it "accepts properly formatted email addresses" do
    emails = ["test@example.com", "test.test@example.com", "test_test@example.com", "test.test.tset@example.com"]
    emails.each do |email|
      user = User.new(user_attributes(email: email))
      expect(user).to be_valid
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = ["@example.com", "@", "space @example.com"]
    emails.each do |bad_email|
      user = User.new(name: "test",
                      email: bad_email,
                      password: "password")

      expect(user).not_to be_valid
    end
  end

  it "requires a unique, case insensitive email address" do
    user1 = User.create!(user_attributes)

    user2 = User.new(email: user1.email.upcase)
    
    expect(user2).not_to be_valid
  end

  it "is valid with example attributes" do
    user = User.new(user_attributes)

    expect(user).to be_valid
  end

  it "requires a password" do
    user = User.new(password: "")

    expect(user).not_to be_valid
  end

  it "requires a password confirmation when a password is present" do
    user = User.new(password: "secret", password_confirmation: "")

    expect(user).not_to be_valid
  end

  it "requires the password to match the password confirmation" do
    user = User.new(password: "secret", password_confirmation: "nomatch")

    expect(user).not_to be_valid
  end

  it "requires a password and matching password confirmation when creating" do
    user = User.create!(user_attributes(password: "secret", password_confirmation: "secret"))

    expect(user).to be_valid
  end

  it "does not require a password when updating" do
    user = User.create!(user_attributes)

    user.password = ""

    expect(user).to be_valid
  end

  it "has reviews" do
    user = User.create!(user_attributes)
    resource1 = Resource.create!(resource_attributes(name: "Resource 1", link: "http://one.com"))
    resource2 = Resource.create!(resource_attributes(name: "Resource 2", link: "http://two.com"))

    review1 = resource1.reviews.new(comment: "Great resource", rating: 5)
    review1.user = user
    review1.save

    review2 = resource2.reviews.new(comment: "Good resource", rating: 3)
    review2.user = user
    review2.save

    expect(user.reviews).to include(review1)
    expect(user.reviews).to include(review2)
  end
end
