class IndirectAssociationsController < ApplicationController
  before_action :set_indirect_association, only: [:show, :edit, :update, :destroy]

  # GET /indirect_associations
  def index
    @indirect_associations = IndirectAssociation.all
  end

  # GET /indirect_associations/1
  def show
  end

  # GET /indirect_associations/new
  def new
    @indirect_association = IndirectAssociation.new
  end

  # GET /indirect_associations/1/edit
  def edit
  end

  # POST /indirect_associations
  def create
    @indirect_association = IndirectAssociation.new(indirect_association_params)

    if @indirect_association.save
      redirect_to @indirect_association, notice: 'Indirect association was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /indirect_associations/1
  def update
    if @indirect_association.update(indirect_association_params)
      redirect_to @indirect_association, notice: 'Indirect association was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /indirect_associations/1
  def destroy
    @indirect_association.destroy
    redirect_to indirect_associations_url, notice: 'Indirect association was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indirect_association
      @indirect_association = IndirectAssociation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def indirect_association_params
      params.require(:indirect_association).permit(:name, :source_association_id, :source_association_type, :through_association_id, :through_association_type, :origin_model_id, :terminus_model_id)
    end
end
