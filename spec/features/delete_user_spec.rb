require 'rails_helper'

describe "Deleting a user" do
  it "removes user from the database" do
    user = User.create(user_attributes)

    visit user_url(user)

    expect {
      click_on("Delete")
    }.to change(User, :count).by(-1)

    expect(current_path).to eq(root_path)
    expect(page).to have_text("Account successfully deleted!")
  end
end
