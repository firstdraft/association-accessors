class ModelResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :idea_id, :integer

  # Direct associations

  belongs_to :idea

  has_many   :terminating_indirect_associations,
             resource: IndirectAssociationResource,
             foreign_key: :terminus_model_id

  has_many   :originating_indirect_associations,
             resource: IndirectAssociationResource,
             foreign_key: :origin_model_id

  has_many   :terminating_direct_associations,
             resource: DirectAssociationResource,
             foreign_key: :terminus_model_id

  has_many   :originating_direct_associations,
             resource: DirectAssociationResource,
             foreign_key: :origin_model_id

  # Indirect associations

  has_many :direct_origin_models, resource: ModelResource do
    assign_each do |model, models|
      models.select do |m|
        m.id.in?(model.direct_origin_models.map(&:id))
      end
    end
  end

  has_many :direct_terminus_models, resource: ModelResource do
    assign_each do |model, models|
      models.select do |m|
        m.id.in?(model.direct_terminus_models.map(&:id))
      end
    end
  end

  filter :origin_model_id, :integer do
    eq do |scope, value|
      scope.eager_load(:direct_origin_models).where(direct_associations: { origin_model_id: value })
    end
  end

  filter :terminus_model_id, :integer do
    eq do |scope, value|
      scope.eager_load(:direct_terminus_models).where(direct_associations: { terminus_model_id: value })
    end
  end
end
