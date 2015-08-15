def resource_attributes(overrides = {})
  {
    name: "New Resource",
    description: "This is a wonderful online resource to assist with learning ruby",
    link: "http://resource.com",
  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    name: "Rich",
    rating: 3,
    comment: "This resource is average. Nothing special"
  }.merge(overrides)
end

def user_attributes(overrides = {})
  {
    name: "Username",
    email: "username@example.com",
    password: "password",
    password_confirmation: "password"
  }
end
