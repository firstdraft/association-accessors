class DirectAssociationsController < ApplicationController
  before_action :set_direct_association, only: [:show, :edit, :update, :destroy]

  # GET /direct_associations
  def index
    @direct_associations = DirectAssociation.all
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
      redirect_to @direct_association, notice: 'Direct association was successfully created.'
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
    redirect_to direct_associations_url, notice: 'Direct association was successfully destroyed.'
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
