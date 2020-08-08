class AssociationsController < ApplicationController
  before_action :set_association, only: %i[show edit update destroy]

  def index
    @q = Association.ransack(params[:q])
    @associations = @q.result(distinct: true).includes(:origin_model, :terminus_model, :direct_origin_model, :direct_terminus_model, :indirect_origin_model, :indirect_terminus_model, :indirect_associations_as_source, :source_association, :indirect_associations_as_through, :through_association, :indirect_associations_as_source, :source_association, :indirect_associations_as_through, :through_association, :indirect_associations_as_source, :source_association, :indirect_associations_as_source, :source_association, :indirect_associations_as_through, :through_association, :indirect_associations_as_through, :through_association, :indirect_associations_as_source, :source_association, :indirect_associations_as_source, :source_association, :indirect_associations_as_source, :source_association, :indirect_associations_as_source, :source_association, :indirect_associations_as_through, :through_association, :indirect_associations_as_through, :through_association, :indirect_associations_as_through, :through_association, :indirect_associations_as_through, :through_association).page(params[:page]).per(10)
  end

  def show; end

  def new
    @association = Association.new
  end

  def edit; end

  def create
    @association = Association.new(association_params)
    @association.save(validate: false)
    redirect_to association_step_path(@association, Association.form_steps.first)
  end

  def update
    if @association.update(association_params)
      redirect_to @association, notice: 'Association was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @association.destroy
    message = 'Association was successfully deleted.'
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to associations_url, notice: message
    end
  end

  private

  def set_association
    @association = Association.find(params[:id])
  end

  def association_params
    params.require(:association).permit(:name, :source_association_id, :through_association_id, :origin_model_id, :terminus_model_id, :foreign_key, :nature, :idea_id)
  end
end
