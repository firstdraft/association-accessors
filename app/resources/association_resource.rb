class AssociationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :source_association_id, :integer
  attribute :through_association_id, :integer
  attribute :origin_model_id, :integer
  attribute :terminus_model_id, :integer
  attribute :foreign_key, :string
  attribute :nature, :integer_enum, allow: Association.natures.keys

  # Direct associations

  belongs_to :through_association,
             resource: AssociationResource

  has_many   :indirect_associations_as_through,
             resource: AssociationResource,
             foreign_key: :through_association_id

  belongs_to :source_association,
             resource: AssociationResource

  has_many   :indirect_associations_as_source,
             resource: AssociationResource,
             foreign_key: :source_association_id

  belongs_to :indirect_terminus_model,
             resource: ModelResource,
             foreign_key: :terminus_model_id

  belongs_to :indirect_origin_model,
             resource: ModelResource,
             foreign_key: :origin_model_id

  belongs_to :direct_terminus_model,
             resource: ModelResource,
             foreign_key: :terminus_model_id

  belongs_to :direct_origin_model,
             resource: ModelResource,
             foreign_key: :origin_model_id

  belongs_to :terminus_model,
             resource: ModelResource

  belongs_to :origin_model,
             resource: ModelResource

  # Indirect associations
end
