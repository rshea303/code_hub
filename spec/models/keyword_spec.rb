require 'rails_helper'

RSpec.describe Keyword, type: :model do
  it "is valid with a name" do
    keyword = Keyword.new(name: "Keyword")
    
    expect(keyword).to be_valid
  end

  it "is not valid without a name" do
    keyword = Keyword.new(name: nil)
    
    expect(keyword).not_to be_valid
  end
end
