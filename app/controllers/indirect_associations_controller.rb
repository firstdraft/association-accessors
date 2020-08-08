class IndirectAssociationsController < ApplicationController
  before_action :set_indirect_association, only: %i[show edit update destroy]

  def index
    @q = IndirectAssociation.ransack(params[:q])
    @indirect_associations = @q.result(distinct: true).includes(:origin_model, :terminus_model).page(params[:page]).per(10)
  end

  def show; end

  def new
    @indirect_association = IndirectAssociation.new
  end

  def edit; end

  def create
    @indirect_association = IndirectAssociation.new(indirect_association_params)

    if @indirect_association.save
      message = "IndirectAssociation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @indirect_association, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @indirect_association.update(indirect_association_params)
      redirect_to @indirect_association, notice: "Indirect association was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @indirect_association.destroy
    message = "IndirectAssociation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to indirect_associations_url, notice: message
    end
  end

  private

  def set_indirect_association
    @indirect_association = IndirectAssociation.find(params[:id])
  end

  def indirect_association_params
    params.require(:indirect_association).permit(:name, :source_association_id, :source_association_type, :through_association_id, :through_association_type, :origin_model_id, :terminus_model_id)
  end
end
