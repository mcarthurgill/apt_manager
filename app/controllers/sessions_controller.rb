class SessionsController < ApplicationController
  skip_before_filter :authorize_as_admin

  def new
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
      session[:rental_id] = user.rental.id if user.rental
  		redirect_to user_path(user), notice: "Logged In"
  	else
  		redirect_to new_session_path, notice: "Login information is invalid"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "Logged Out"
  end
end
