def resource_attributes(overrides = {})
  {
    name: "New Resource",
    description: "This is a wonderful online resource to assist with learning ruby",
    link: "http://resource.com",
    rating: 3
  }.merge(overrides)
end
