class Api::V1::ModelsController < Api::V1::GraphitiController
  def index
    models = ModelResource.all(params)
    respond_with(models)
  end

  def show
    model = ModelResource.find(params)
    respond_with(model)
  end

  def create
    model = ModelResource.build(params)

    if model.save
      render jsonapi: model, status: 201
    else
      render jsonapi_errors: model
    end
  end

  def update
    model = ModelResource.find(params)

    if model.update_attributes
      render jsonapi: model
    else
      render jsonapi_errors: model
    end
  end

  def destroy
    model = ModelResource.find(params)

    if model.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: model
    end
  end
end
