require 'rails_helper'

describe FavoritesController do

  before do
    @resource = Resource.create!(resource_attributes)
  end

  context "when not signed in" do

    before do
      session[:user_id] = nil
    end

    it "cannot access create" do
      post :create, resource_id: @resource

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: 1, resource_id: @resource

      expect(response).to redirect_to(new_session_url)
    end
  end
end
