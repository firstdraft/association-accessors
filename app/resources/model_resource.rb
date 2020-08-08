class ModelResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :idea_id, :integer

  # Direct associations

  belongs_to :idea

  has_many   :indirect_terminating_associations,
             resource: AssociationResource,
             foreign_key: :terminus_model_id

  has_many   :indirect_originating_associations,
             resource: AssociationResource,
             foreign_key: :origin_model_id

  has_many   :direct_terminating_associations,
             resource: AssociationResource,
             foreign_key: :terminus_model_id

  has_many   :direct_originating_associations,
             resource: AssociationResource,
             foreign_key: :origin_model_id

  has_many   :terminating_associations,
             resource: AssociationResource,
             foreign_key: :terminus_model_id

  has_many   :originating_associations,
             resource: AssociationResource,
             foreign_key: :origin_model_id

  # Indirect associations

  has_many :terminating_associations, resource: ModelResource do
    assign_each do |model, models|
      models.select do |m|
        m.id.in?(model.terminating_associations.map(&:id))
      end
    end
  end

  has_many :terminus_models, resource: ModelResource do
    assign_each do |model, models|
      models.select do |m|
        m.id.in?(model.terminus_models.map(&:id))
      end
    end
  end

  has_many :indirect_origin_models, resource: ModelResource do
    assign_each do |model, models|
      models.select do |m|
        m.id.in?(model.indirect_origin_models.map(&:id))
      end
    end
  end

  has_many :indirect_terminus_models, resource: ModelResource do
    assign_each do |model, models|
      models.select do |m|
        m.id.in?(model.indirect_terminus_models.map(&:id))
      end
    end
  end

  filter :origin_model_id, :integer do
    eq do |scope, value|
      scope.eager_load(:indirect_origin_models).where(associations: { origin_model_id: value })
    end
  end

  filter :terminus_model_id, :integer do
    eq do |scope, value|
      scope.eager_load(:indirect_terminus_models).where(associations: { terminus_model_id: value })
    end
  end
end
