class BgImagesController < ApplicationController
  # GET /bg_images
  # GET /bg_images.json
  def index
    @bg_images = BgImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bg_images }
    end
  end

  # GET /bg_images/1
  # GET /bg_images/1.json
  def show
    @bg_image = BgImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bg_image }
    end
  end

  # GET /bg_images/new
  # GET /bg_images/new.json
  def new
    @bg_image = BgImage.new
    @bg_images = BgImage.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bg_image }
    end
  end

  # GET /bg_images/1/edit
  def edit
    @bg_image = BgImage.find(params[:id])
  end

  # POST /bg_images
  # POST /bg_images.json
  def create
    @bg_image = BgImage.new(params[:bg_image])

    respond_to do |format|
      if @bg_image.save
        format.html { redirect_to @bg_image, notice: 'Bg image was successfully created.' }
        format.json { render json: @bg_image, status: :created, location: @bg_image }
      else
        format.html { render action: "new" }
        format.json { render json: @bg_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bg_images/1
  # PUT /bg_images/1.json
  def update
    @bg_image = BgImage.find(params[:id])

    respond_to do |format|
      if @bg_image.update_attributes(params[:bg_image])
        format.html { redirect_to @bg_image, notice: 'Bg image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bg_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bg_images/1
  # DELETE /bg_images/1.json
  def destroy
    @bg_image = BgImage.find(params[:id])
    @bg_image.destroy

    respond_to do |format|
      format.html { redirect_to bg_images_url }
      format.json { head :no_content }
    end
  end
end
