class Api::V1::DirectAssociationsController < Api::V1::GraphitiController
  def index
    direct_associations = DirectAssociationResource.all(params)
    respond_with(direct_associations)
  end

  def show
    direct_association = DirectAssociationResource.find(params)
    respond_with(direct_association)
  end

  def create
    direct_association = DirectAssociationResource.build(params)

    if direct_association.save
      render jsonapi: direct_association, status: 201
    else
      render jsonapi_errors: direct_association
    end
  end

  def update
    direct_association = DirectAssociationResource.find(params)

    if direct_association.update_attributes
      render jsonapi: direct_association
    else
      render jsonapi_errors: direct_association
    end
  end

  def destroy
    direct_association = DirectAssociationResource.find(params)

    if direct_association.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: direct_association
    end
  end
end
