class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize_as_admin

  private

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
  	helper_method :current_user

  	def authorize
  		redirect_to login_path, alert: "You must login first" unless current_user
  	end

    def authorize_as_admin
      if current_user
        if current_user.admin
          return
        end
        redirect_to user_path(current_user)
      else
        redirect_to login_path, alert: "You must log in"
      end
    end
end
