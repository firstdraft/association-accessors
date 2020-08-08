class Api::V1::IndirectAssociationsController < Api::V1::GraphitiController
  def index
    indirect_associations = IndirectAssociationResource.all(params)
    respond_with(indirect_associations)
  end

  def show
    indirect_association = IndirectAssociationResource.find(params)
    respond_with(indirect_association)
  end

  def create
    indirect_association = IndirectAssociationResource.build(params)

    if indirect_association.save
      render jsonapi: indirect_association, status: 201
    else
      render jsonapi_errors: indirect_association
    end
  end

  def update
    indirect_association = IndirectAssociationResource.find(params)

    if indirect_association.update_attributes
      render jsonapi: indirect_association
    else
      render jsonapi_errors: indirect_association
    end
  end

  def destroy
    indirect_association = IndirectAssociationResource.find(params)

    if indirect_association.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: indirect_association
    end
  end
end
