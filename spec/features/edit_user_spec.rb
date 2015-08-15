require 'rails_helper'

describe "Editing a user" do
  it "updates the user attributes" do
    user = User.create(user_attributes)

    visit user_path(user)
    click_on("Edit")

    fill_in "user[name]", with: "Updated name"
    click_on("Update Account")

    expect(page).to have_text("Updated name")
    expect(page).not_to have_text(user.name)
  end
end
