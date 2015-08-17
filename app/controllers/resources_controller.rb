class ResourcesController < ApplicationController
  before_action :require_sign_in, except: [:show, :index]
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @resources = Resource.all
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

    redirect_to resource_path(@resource), notice: "Resource successfully updated!"
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      redirect_to resource_path(@resource), notice: "Resource successfully created!"
    else
      render :new
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to resources_path, alert: "Resource successfully destroyed!"
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :description, :link)
  end

  end
