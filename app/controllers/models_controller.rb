class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]

  # GET /models
  def index
    @models = Model.page(params[:page]).per(10)
  end

  # GET /models/1
  def show
    @indirect_association = IndirectAssociation.new
    @direct_association = DirectAssociation.new
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  def create
    @model = Model.new(model_params)

    if @model.save
      message = 'Model was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @model, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /models/1
  def update
    if @model.update(model_params)
      redirect_to @model, notice: 'Model was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /models/1
  def destroy
    @model.destroy
    message = "Model was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to models_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def model_params
      params.require(:model).permit(:name, :idea_id)
    end
end
