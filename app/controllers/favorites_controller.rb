class FavoritesController < ApplicationController
  before_action :require_sign_in, only: [:create, :destroy]
  before_action :set_resource

  def create
    @resource.favorites.create!(user: current_user)
    redirect_to resource_path(@resource), notice: "#{@resource.name} has been added to your favorites!"
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy
    redirect_to resource_path(@resource), alert: "Resource removed from favorites" 
  end

  private

  def set_resource
    @resource = Resource.find(params[:resource_id])
  end
end
