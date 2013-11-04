class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to users_path, notice: "Logged In As #{user.name}"
  	else
  		redirect_to new_session_path, notice: "Login information is invalid"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "Logged Out"
  end
end
