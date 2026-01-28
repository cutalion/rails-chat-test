module Admin
  class SessionsController < ApplicationController
    def new
    end

    def create
      admin = Administrator.find_by(nickname: params[:nickname])

      if admin
        session[:admin_id] = admin.id
        redirect_to admin_dashboard_path, notice: "Welcome, #{admin.nickname}!"
      else
        flash.now[:alert] = "Admin not found"
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      session[:admin_id] = nil
      redirect_to root_path, notice: "You have been logged out"
    end
  end
end
