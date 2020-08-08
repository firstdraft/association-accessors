class Association < ApplicationRecord
  enum nature: { "direct" => 0, "indirect" => 1 }

  # Direct associations

  belongs_to :through_association,
             class_name: "Association",
             counter_cache: :indirect_associations_as_through_count,
             required: false

  has_many   :indirect_associations_as_through,
             class_name: "Association",
             foreign_key: "through_association_id",
             dependent: :destroy

  belongs_to :source_association,
             class_name: "Association",
             counter_cache: :indirect_associations_as_source_count,
             required: false

  has_many   :indirect_associations_as_source,
             class_name: "Association",
             foreign_key: "source_association_id",
             dependent: :destroy

  belongs_to :indirect_terminus_model,
             class_name: "Model",
             foreign_key: "terminus_model_id",
             counter_cache: :indirect_terminating_associations_count,
             required: false

  belongs_to :indirect_origin_model,
             class_name: "Model",
             foreign_key: "origin_model_id",
             counter_cache: :indirect_originating_associations_count,
             required: false

  belongs_to :direct_terminus_model,
             class_name: "Model",
             foreign_key: "terminus_model_id",
             counter_cache: :direct_terminating_associations_count,
             required: false

  belongs_to :direct_origin_model,
             class_name: "Model",
             foreign_key: "origin_model_id",
             counter_cache: :direct_originating_associations_count,
             required: false

  belongs_to :terminus_model,
             class_name: "Model",
             counter_cache: :terminating_associations_count

  belongs_to :origin_model,
             class_name: "Model",
             counter_cache: :originating_associations_count

  # Indirect associations

  # Validations

  # Scopes

  scope :direct, -> { where(nature: [:direct]) }

  scope :indirect, -> { where(nature: [:indirect]) }

  def to_s
    name
  end
end
