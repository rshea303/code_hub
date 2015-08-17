require 'rails_helper'

describe ResourcesController do 

  context "when not an admin" do

    before do
      @resource = Resource.create!(resource_attributes)
      @non_admin_user = User.create!(user_attributes) 
      session[:user_id] = @non_admin_user
    end

    it "cannot access destroy" do
      delete :destroy, id: @resource

      expect(response).to redirect_to(root_url)
    end
  end
end
