class ModelsController < ApplicationController
  before_action :set_model, only: %i[show edit update destroy]

  def index
    @q = Model.ransack(params[:q])
    @models = @q.result(distinct: true).includes(:originating_associations, :terminating_associations, :direct_originating_associations, :direct_terminating_associations, :indirect_originating_associations, :indirect_terminating_associations, :idea, :indirect_terminus_models, :indirect_origin_models, :terminus_models, :terminating_associations).page(params[:page]).per(10)
  end

  def show
    @association = Association.new
  end

  def new
    @model = Model.new
  end

  def edit; end

  def create
    @model = Model.new(model_params)

    if @model.save
      message = "Model was successfully created."
      
      redirect_to @model.idea, notice: message
    else
      render :new
    end
  end

  def update
    if @model.update(model_params)
      redirect_to @model, notice: "Model was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @model.destroy
    message = "Model was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to models_url, notice: message
    end
  end

  private

  def set_model
    @model = Model.find(params[:id])
  end

  def model_params
    params.require(:model).permit(:name, :idea_id)
  end
end
