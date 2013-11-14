class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize_as_admin

  private

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

  	def authorize
      @home = true
      @bgs = BgImage.all.sample
  		redirect_to login_path, alert: "You must login first" unless current_user
  	end

    def authorize_as_admin
      if current_user
        if current_user.admin
          @home = false
          return
        end
        redirect_to user_path(current_user), alert: "You do not have permission to go there"
      else
        redirect_to login_path, alert: "You must log in"
      end
    end
end
