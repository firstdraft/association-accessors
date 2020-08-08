class IndirectAssociation < ApplicationRecord
  # Direct associations

  belongs_to :origin_model,
             :class_name => "Model",
             :counter_cache => :originating_indirect_associations_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
