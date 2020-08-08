class IdeasController < ApplicationController
  before_action :current_user_must_be_idea_user, only: [:edit, :update, :destroy] 

  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  # GET /ideas
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  def show
    @model = Model.new
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      message = 'Idea was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @idea, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /ideas/1
  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea.destroy
    message = "Idea was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to ideas_url, notice: message
    end
  end


  private

  def current_user_must_be_idea_user
    set_idea
    unless current_user == @idea.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def idea_params
      params.require(:idea).permit(:name, :user_id)
    end
end
