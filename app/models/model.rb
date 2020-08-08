# == Schema Information
#
# Table name: models
#
#  id                                      :bigint           not null, primary key
#  class_name                              :string
#  direct_originating_associations_count   :integer
#  direct_terminating_associations_count   :integer
#  foreign_key_locations_count             :integer          default(0)
#  indirect_originating_associations_count :integer
#  indirect_terminating_associations_count :integer
#  name                                    :string
#  originating_associations_count          :integer
#  plural_name                             :string
#  singular_name                           :string
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
             class_name: 'Association',
             foreign_key: 'terminus_model_id',
             dependent: :destroy

  has_many   :indirect_originating_associations,
             -> { indirect },
             class_name: 'Association',
             foreign_key: 'origin_model_id',
             dependent: :destroy

  has_many   :direct_terminating_associations,
             -> { direct },
             class_name: 'Association',
             foreign_key: 'terminus_model_id',
             dependent: :destroy

  has_many   :direct_originating_associations,
             -> { direct },
             class_name: 'Association',
             foreign_key: 'origin_model_id',
             dependent: :destroy

  has_many   :terminating_associations,
             class_name: 'Association',
             foreign_key: 'terminus_model_id',
             dependent: :destroy

  has_many   :originating_associations,
             class_name: 'Association',
             foreign_key: 'origin_model_id',
             dependent: :destroy

  # Indirect associations

  has_many   :indirect_origin_models,
             through: :indirect_terminating_associations,
             source: :indirect_origin_model

  has_many   :indirect_terminus_models,
             through: :indirect_originating_associations,
             source: :indirect_terminus_model

  # Validations

  validates :class_name, presence: true, uniqueness: { scope: :idea_id }

  # Scopes

  before_validation :normalize_name

  def normalize_name
    self.plural_name = name.pluralize.parameterize(separator: '_')
    self.singular_name = plural_name.singularize
    self.class_name = singular_name.classify
  end

  def to_s
    class_name
  end
end
