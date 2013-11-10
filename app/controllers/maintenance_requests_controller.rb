class MaintenanceRequestsController < ApplicationController
  skip_before_filter :authorize_as_admin, :only => :new

  # GET /maintenance_requests
  # GET /maintenance_requests.json
  def index
    @maintenance_requests = MaintenanceRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintenance_requests }
    end
  end

  # GET /maintenance_requests/1
  # GET /maintenance_requests/1.json
  def show
    @maintenance_request = MaintenanceRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maintenance_request }
    end
  end

  # GET /maintenance_requests/new
  # GET /maintenance_requests/new.json
  def new
    @maintenance_request = MaintenanceRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maintenance_request }
    end
  end

  # GET /maintenance_requests/1/edit
  def edit
    @maintenance_request = MaintenanceRequest.find(params[:id])
  end

  # POST /maintenance_requests
  # POST /maintenance_requests.json
  def create
    @maintenance_request = MaintenanceRequest.new(params[:maintenance_request])

    respond_to do |format|
      if @maintenance_request.save
        format.html { redirect_to @maintenance_request, notice: 'Maintenance request was successfully created.' }
        format.json { render json: @maintenance_request, status: :created, location: @maintenance_request }
      else
        format.html { render action: "new" }
        format.json { render json: @maintenance_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maintenance_requests/1
  # PUT /maintenance_requests/1.json
  def update
    @maintenance_request = MaintenanceRequest.find(params[:id])

    respond_to do |format|
      if @maintenance_request.update_attributes(params[:maintenance_request])
        format.html { redirect_to @maintenance_request, notice: 'Maintenance request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maintenance_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_requests/1
  # DELETE /maintenance_requests/1.json
  def destroy
    @maintenance_request = MaintenanceRequest.find(params[:id])
    @maintenance_request.destroy

    respond_to do |format|
      format.html { redirect_to maintenance_requests_url }
      format.json { head :no_content }
    end
  end
end
