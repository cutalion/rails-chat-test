module Admin
  class DashboardController < ApplicationController
    before_action :require_admin

    def index
      @users = User.all
    end
  end
end
