require 'rails_helper'

RSpec.describe Resource, type: :model do
  it "is poor if rating is less than 3" do
    resource = Resource.new(rating: 2)

    expect(resource.poor?).to eq(true)
  end
end
