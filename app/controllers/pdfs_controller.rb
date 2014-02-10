class PdfsController < ApplicationController
  # GET /pdfs
  # GET /pdfs.json
  def index
    @pdfs = Pdf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pdfs }
    end
  end

  # GET /pdfs/1
  # GET /pdfs/1.json
  def show
    @pdf = Pdf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdf }
    end
  end

  # GET /pdfs/new
  # GET /pdfs/new.json
  def new
    @pdf = Pdf.new
    @rentals = Rental.all.inject([]) { |arr, rental| arr << [rental.name, rental.id]}
    @users = User.all.inject([]) { |arr, user| arr << [user.name, user.id]}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pdf }
    end
  end

  # GET /pdfs/1/edit
  def edit
    @pdf = Pdf.find(params[:id])
    @rentals = Rental.all.inject([]) { |arr, rental| arr << [rental.name, rental.id]}
    @users = User.all.inject([]) { |arr, user| arr << [user.name, user.id]}
  end

  # POST /pdfs
  # POST /pdfs.json
  def create
    @pdf = Pdf.new(params[:pdf])

    respond_to do |format|
      if @pdf.save
        if @pdf.user
          format.html { redirect_to pdfs_path, notice: 'Pdf was successfully created.' }
        elsif @pdf.rental
          format.html { redirect_to rental_path(@pdf.rental), notice: 'Pdf was successfully created.' }
        end
        format.json { render json: @pdf, status: :created, location: @pdf }
      else
        format.html { render action: "new" }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pdfs/1
  # PUT /pdfs/1.json
  def update
    @pdf = Pdf.find(params[:id])

    respond_to do |format|
      if @pdf.update_attributes(params[:pdf])
        format.html { redirect_to @pdf, notice: 'Pdf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdfs/1
  # DELETE /pdfs/1.json
  def destroy
    @pdf = Pdf.find(params[:id])
    @pdf.destroy

    respond_to do |format|
      format.html { redirect_to pdfs_url }
      format.json { head :no_content }
    end
  end
end
