require 'rails_helper'

describe "Viewing the list of resources" do
  it "shows the resources with an average rating of 3 or higher" do
    resource1 = Resource.create(name: "Resource 1", 
                                description: "this is the greatest resource in the world", 
                                link: "http://resource1.com") 
    resource2 = Resource.create(name: "Resource 2", 
                                description: "Lots of great code examples", 
                                link: "http://resource2.com") 
    resource3 = Resource.create(name: "Resource 3", 
                                description: "Lacks structure. Not very helpful at all", 
                                link: "http://resource3.com") 

    visit resources_url 

    expect(page).to have_text("3 Resources")
    expect(page).to have_link(resource1.name)
    expect(page).to have_link(resource2.name)
    expect(page).to have_link(resource3.name)
    expect(page).to have_text(resource1.description)
  end

end

