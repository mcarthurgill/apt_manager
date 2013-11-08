class RentalsController < ApplicationController

  skip_before_filter :authorize_as_admin, :only => :show

  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rentals }
    end
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
    @rental = Rental.find(params[:id])
    @images = @rental.images
    @pdfs = @rental.pdfs

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/new
  # GET /rentals/new.json
  def new
    @rental = Rental.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rental }
    end
  end

  # GET /rentals/1/edit
  def edit
    @rental = Rental.find(params[:id])
    @rental.images.build
    render :edit
  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(params[:rental])

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render json: @rental, status: :created, location: @rental }
      else
        format.html { render action: "new" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rentals/1
  # PUT /rentals/1.json
  def update
    @rental = Rental.find(params[:id])

    respond_to do |format|
      if @rental.update_attributes(params[:rental])
        format.html { redirect_to rental_path(@rental), notice: 'Rental was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy

    respond_to do |format|
      format.html { redirect_to rentals_url }
      format.json { head :no_content }
    end
  end


  def match
    @rentals = Rental.all
    @users = User.tenants
  end

  def create_match
    rental = Rental.find(params[:rental_id])
    user = User.find(params[:user_id])
    respond_to do |format|
      if rental && user 
        rental.user = user
        user.rental = rental 
        user.save!
        rental.save!
        format.html { redirect_to matches_path, notice: 'Match was successfully created.' }
      else
        format.html { redirect_to match_path, notice: 'Something went wrong. Try again.' }
      end
    end
  end

  def matches
    @matches = Rental.matches
  end
end
