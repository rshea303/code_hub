require 'rails_helper'

describe ReviewsController do

  before do
    @resource = Resource.create!(resource_attributes)
  end

  context "when not signed in" do

    before do
      session[:user_id] = nil
    end

    xit "cannot access index" do
      get :index, resource_id: @resource 

      expect(response).to redirect_to(root_url)
    end

    it "cannot access new" do
      get :new, resource_id: @resource

      expect(response).to redirect_to(root_url)
    end

    it "cannot access create" do
      post :create, resource_id: @resource

      expect(response).to redirect_to(root_url)
    end
  end
end
