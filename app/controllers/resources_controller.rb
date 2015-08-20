class ResourcesController < ApplicationController
  before_action :require_sign_in, except: [:show, :index]
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    if (params[:keyword] && Keyword.pluck(:id).include?(params[:keyword][:keyword_id].to_i))
      keyword = Keyword.find(params[:keyword][:keyword_id])
      @resources = keyword.resources
      @filter = keyword.name
    else
      @resources = Resource.all
      @filter = "All"
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @fans = @resource.fans
    @keywords = @resource.keywords

    if current_user
      @current_favorite = current_user.favorites.find_by(resource_id: @resource.id)
      @previous_review = current_user.reviews.find_by(resource_id: @resource.id)
    end
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
    @keywords = Keyword.all
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
    params.require(:resource).permit(:name, :description, :link, keyword_ids: [])
  end

  end
