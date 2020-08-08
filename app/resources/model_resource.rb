class ModelResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :idea_id, :integer

  # Direct associations

  has_many   :originating_direct_associations,
             resource: DirectAssociationResource,
             foreign_key: :origin_model_id

  # Indirect associations

end
