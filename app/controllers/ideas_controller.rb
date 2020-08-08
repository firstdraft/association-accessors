class IdeasController < ApplicationController
  before_action :current_user_must_be_idea_user, only: %i[edit update destroy]

  before_action :set_idea, only: %i[show edit update destroy]

  def index
    # @q = Idea.ransack(params[:q])
    # @ideas = @q.result(distinct: true).includes(:user, :models).page(params[:page]).per(10)
    @ideas = current_user.ideas
  end

  def show
    @model = Model.new
  end

  def new
    @idea = Idea.new
  end

  def edit; end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      message = 'Idea was successfully created.'
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @idea, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @idea.destroy
    message = 'Idea was successfully deleted.'
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to ideas_url, notice: message
    end
  end

  private

  def current_user_must_be_idea_user
    set_idea
    unless current_user == @idea.user
      redirect_back fallback_location: root_path, alert: 'You are not authorized for that.'
    end
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:name, :user_id)
  end
end
