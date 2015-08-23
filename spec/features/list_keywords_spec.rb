require 'rails_helper'

describe "Viewing the list of keywords" do
  it "displays all of the keywords" do
    kw1 = Keyword.create!(name: "Kw1")
    kw2 = Keyword.create!(name: "Kw2")
    kw3 = Keyword.create!(name: "Kw3")
    admin = User.create!(user_attributes(email: "admin@example.com", admin: true))

    visit root_url
    sign_in(admin)

    visit keywords_url

    expect(page).to have_text("Kw1")
    expect(page).to have_text("Kw2")
    expect(page).to have_text("Kw3")
  end
end
