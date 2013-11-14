class DummiesController < ApplicationController
  
  # GET /dummies/1/edit
  def edit
    @dummy = Dummy.find(params[:id])
    @dummy.bg_images.build
    render :edit
  end


  # PUT /dummies/1
  # PUT /dummies/1.json
  def update
    @dummy = Dummy.find(params[:id])

    respond_to do |format|
      if @dummy.update_attributes(params[:dummy])
        format.html { redirect_to edit_dummy_path(@dummy), notice: 'Background images were successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dummy.errors, status: :unprocessable_entity }
      end
    end
  end
end
