class Model < ApplicationRecord
  # Direct associations

  belongs_to :idea

  has_many   :indirect_terminating_associations,
             class_name: "Association",
             foreign_key: "terminus_model_id",
             dependent: :destroy

  has_many   :indirect_originating_associations,
             class_name: "Association",
             foreign_key: "origin_model_id",
             dependent: :destroy

  has_many   :direct_terminating_associations,
             class_name: "Association",
             foreign_key: "terminus_model_id",
             dependent: :destroy

  has_many   :direct_originating_associations,
             class_name: "Association",
             foreign_key: "origin_model_id",
             dependent: :destroy

  has_many   :terminating_associations,
             class_name: "Association",
             foreign_key: "terminus_model_id",
             dependent: :destroy

  has_many   :originating_associations,
             class_name: "Association",
             foreign_key: "origin_model_id",
             dependent: :destroy

  # Indirect associations

  has_many   :terminating_associations,
             through: :terminating_associations,
             source: :origin_model

  has_many   :terminus_models,
             through: :originating_associations,
             source: :terminus_model

  has_many   :indirect_origin_models,
             through: :indirect_terminating_associations,
             source: :indirect_origin_model

  has_many   :indirect_terminus_models,
             through: :indirect_originating_associations,
             source: :indirect_terminus_model

  # Validations

  # Scopes

  def to_s
    name
  end
end
