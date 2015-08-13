class ResourcesController < ApplicationController
  def index
    @resources = Resource.popular
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update(resource_params)

    redirect_to resource_path(@resource)
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to resource_path(@resource)
    else
      render :new
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :link, :rating)
  end
end
