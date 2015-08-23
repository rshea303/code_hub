require 'rails_helper'

describe KeywordsController do

  before do
    session[:user_id] = nil
    @keyword = Keyword.create!(name: "turing")
    @user = User.create!(user_attributes)
    @admin = User.create!(user_attributes(email: "admin@example.com", admin: true))
  end
    
  context "when not signed in" do
    it "cannot access index" do
      get :index

      expect(response).to redirect_to(root_url)
    end

    it "cannot access edit" do
      get :edit, id: @keyword

      expect(response).to redirect_to(root_url)
    end

    it "cannot access update" do
      patch :update, id: @keyword

      expect(response).to redirect_to(root_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @keyword

      expect(response).to redirect_to(root_url)
    end
  end

  context "when not signed in as admin" do

    before do
      session[:user_id] = @user.id
    end

    it "cannot access index" do
      get :index

      expect(response).to redirect_to(root_url)
    end

    it "cannot access edit" do
      get :edit, id: @keyword

      expect(response).to redirect_to(root_url)
    end

    it "cannot access update" do
      patch :update, id: @keyword

      expect(response).to redirect_to(root_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @keyword

      expect(response).to redirect_to(root_url)
    end
 end
end
