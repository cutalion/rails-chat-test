class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(nickname: params[:nickname])

    if user
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Welcome, #{user.nickname}!"
    else
      flash.now[:alert] = "User not found"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out"
  end
end
