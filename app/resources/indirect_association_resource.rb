class IndirectAssociationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :source_association_id, :integer
  attribute :source_association_type, :string
  attribute :through_association_id, :integer
  attribute :through_association_type, :string
  attribute :origin_model_id, :integer
  attribute :terminus_model_id, :integer

  # Direct associations

  belongs_to :terminus_model,
             resource: ModelResource

  belongs_to :origin_model,
             resource: ModelResource

  # Indirect associations

end
