class UsersController < ApplicationController
  skip_before_filter :authorize_as_admin, :only => [:show, :payments, :pay_rent]
  before_filter :authorize, :only => [:show, :payments, :pay_rent]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @pdfs = @user.pdfs
    
    respond_to do |format|
      if @user.admin
        format.html { redirect_to rentals_path }
      else 
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def delete_match
    user = User.find_by_name(params[:user])
    rental = Rental.find_by_name(params[:rental])
    user.rental = nil if user.rental == rental
    rental.user = nil if rental.user == user
    user.save! 
    rental.save!
    redirect_to matches_path, :notice => "Match was deleted"
  end

  def payments
    @user = User.find(params[:id])
    @payments = Payment.where("user_id = ?", @user.id)
  end

  def pay_rent
    @banks = Bank.all
    @hash = Gmaps4rails.build_markers(@banks) do |bank, marker|
      marker.lat bank.latitude
      marker.lng bank.longitude
      marker.infowindow render_to_string(:partial => "shared/hover", :locals => { :bank => bank })
    end
    p @hash
    p "*"*50
  end
end
