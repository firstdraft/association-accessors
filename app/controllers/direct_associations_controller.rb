class DirectAssociationsController < ApplicationController
  before_action :set_direct_association, only: [:show, :edit, :update, :destroy]

  # GET /direct_associations
  def index
    @direct_associations = DirectAssociation.page(params[:page]).per(10)
  end

  # GET /direct_associations/1
  def show
  end

  # GET /direct_associations/new
  def new
    @direct_association = DirectAssociation.new
  end

  # GET /direct_associations/1/edit
  def edit
  end

  # POST /direct_associations
  def create
    @direct_association = DirectAssociation.new(direct_association_params)

    if @direct_association.save
      message = 'DirectAssociation was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @direct_association, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /direct_associations/1
  def update
    if @direct_association.update(direct_association_params)
      redirect_to @direct_association, notice: 'Direct association was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /direct_associations/1
  def destroy
    @direct_association.destroy
    message = "DirectAssociation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to direct_associations_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direct_association
      @direct_association = DirectAssociation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def direct_association_params
      params.require(:direct_association).permit(:foreign_key, :name, :origin_model_id, :terminus_model_id)
    end
end
