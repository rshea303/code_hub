class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(session[:intended_url] || user)
      session[:intended_url] = nil
    else
      redirect_to :back, alert: "Invalid email/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to resources_path, notice: "Come back soon!"
  end
end
