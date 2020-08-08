class Api::V1::AssociationsController < Api::V1::GraphitiController
  def index
    associations = AssociationResource.all(params)
    respond_with(associations)
  end

  def show
    association = AssociationResource.find(params)
    respond_with(association)
  end

  def create
    association = AssociationResource.build(params)

    if association.save
      render jsonapi: association, status: :created
    else
      render jsonapi_errors: association
    end
  end

  def update
    association = AssociationResource.find(params)

    if association.update_attributes
      render jsonapi: association
    else
      render jsonapi_errors: association
    end
  end

  def destroy
    association = AssociationResource.find(params)

    if association.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: association
    end
  end
end
