def resource_attributes(overrides = {})
  {
    name: "New Resource",
    link: "http://resource.com",
    rating: 3
  }.merge(overrides)
end
