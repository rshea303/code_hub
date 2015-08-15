require 'rails_helper'

describe "Show user" do
  it "displays a user attributes" do
    user1 = User.create(user_attributes)

    visit user_url(user1)

    expect(current_path).to eq(user_path(user1))
    expect(page).to have_text(user1.name)
    expect(page).to have_text(user1.email)
  end
end
