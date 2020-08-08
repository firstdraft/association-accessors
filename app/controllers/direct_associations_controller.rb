class DirectAssociationsController < ApplicationController
  before_action :set_direct_association, only: %i[show edit update destroy]

  def index
    @q = DirectAssociation.ransack(params[:q])
    @direct_associations = @q.result(distinct: true).includes(:origin_model, :terminus_model).page(params[:page]).per(10)
  end

  def show; end

  def new
    @direct_association = DirectAssociation.new
  end

  def edit; end

  def create
    @direct_association = DirectAssociation.new(direct_association_params)

    if @direct_association.save
      message = "DirectAssociation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @direct_association, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @direct_association.update(direct_association_params)
      redirect_to @direct_association, notice: "Direct association was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @direct_association.destroy
    message = "DirectAssociation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to direct_associations_url, notice: message
    end
  end

  private

  def set_direct_association
    @direct_association = DirectAssociation.find(params[:id])
  end

  def direct_association_params
    params.require(:direct_association).permit(:foreign_key, :name, :origin_model_id, :terminus_model_id)
  end
end
