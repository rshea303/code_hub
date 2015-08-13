require 'rails_helper'

describe "Viewing the list of resources" do
  it "shows the resources with an average rating of 3 or higher" do
    resource1 = Resource.create(name: "Resource 1", 
                                description: "this is the greatest resource in the world", 
                                link: "http://resource1.com", 
                                rating: 5)
    resource2 = Resource.create(name: "Resource 2", 
                                description: "Lots of great code examples", 
                                link: "http://resource2.com", 
                                rating: 3)
    resource3 = Resource.create(name: "Resource 3", 
                                description: "Lacks structure. Not very helpful at all", 
                                link: "http://resource3.com", 
                                rating: 2)

    visit resources_url 

    expect(page).to have_text("2 Resources")
    expect(page).to have_link(resource1.name)
    expect(page).to have_link(resource2.name)
    expect(page).not_to have_link(resource3.name)

    expect(page).to have_text(resource1.rating)
    expect(page).to have_text(resource1.description)
  end

end

