class DirectAssociation < ApplicationRecord
  # Direct associations

  belongs_to :terminus_model,
             class_name: "Model",
             counter_cache: :terminating_direct_associations_count

  belongs_to :origin_model,
             class_name: "Model",
             counter_cache: :originating_direct_associations_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    foreign_key
  end
end
