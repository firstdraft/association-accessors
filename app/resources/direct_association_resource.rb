class DirectAssociationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :foreign_key, :string
  attribute :name, :string
  attribute :origin_model_id, :integer
  attribute :terminus_model_id, :integer

  # Direct associations

  # Indirect associations

end
