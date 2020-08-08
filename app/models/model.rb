# == Schema Information
#
# Table name: models
#
#  id                                      :integer          not null, primary key
#  direct_originating_associations_count   :integer
#  direct_terminating_associations_count   :integer
#  indirect_originating_associations_count :integer
#  indirect_terminating_associations_count :integer
#  name                                    :string
#  originating_associations_count          :integer
#  terminating_associations_count          :integer
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  idea_id                                 :integer
#
class Model < ApplicationRecord
  # Direct associations

  belongs_to :idea

  has_many   :indirect_terminating_associations,
             -> { indirect },
             class_name: "Association",
             foreign_key: "terminus_model_id",
             dependent: :destroy

  has_many   :indirect_originating_associations,
             -> { indirect },
             class_name: "Association",
             foreign_key: "origin_model_id",
             dependent: :destroy

  has_many   :direct_terminating_associations,
             -> { direct },
             class_name: "Association",
             foreign_key: "terminus_model_id",
             dependent: :destroy

  has_many   :direct_originating_associations,
             -> { direct },
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
