class Api::V1::IdeasController < Api::V1::GraphitiController
  def index
    ideas = IdeaResource.all(params)
    respond_with(ideas)
  end

  def show
    idea = IdeaResource.find(params)
    respond_with(idea)
  end

  def create
    idea = IdeaResource.build(params)

    if idea.save
      render jsonapi: idea, status: 201
    else
      render jsonapi_errors: idea
    end
  end

  def update
    idea = IdeaResource.find(params)

    if idea.update_attributes
      render jsonapi: idea
    else
      render jsonapi_errors: idea
    end
  end

  def destroy
    idea = IdeaResource.find(params)

    if idea.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: idea
    end
  end
end
