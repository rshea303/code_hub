class UsersController < ApplicationController
  before_action :require_sign_in, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @favorite_resources = @user.favorite_resources
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      WelcomeMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Thank you for joining Code-Hub!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Account successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, alert: "Account successfully deleted!"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_correct_user
    user = User.find(params[:id])
    unless current_user == user
      flash[:alert] = "Unauthorized access!"
      redirect_to root_url unless current_user?(user)
    end
  end
end
