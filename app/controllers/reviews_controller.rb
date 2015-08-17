class ReviewsController < ApplicationController
  before_action :require_sign_in, except: [:index]

  def index
    @resource = Resource.find(params[:resource_id])
    @reviews = @resource.reviews
  end

  def new
    @resource = Resource.find(params[:resource_id])
    @review = @resource.reviews.new 
  end

  def create
    @resource = Resource.find(params[:resource_id])
    @review = @resource.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to resource_reviews_path(@resource), notice: "Thanks for your review!"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
