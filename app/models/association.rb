# == Schema Information
#
# Table name: associations
#
#  id                                     :integer          not null, primary key
#  foreign_key                            :string
#  indirect_associations_as_source_count  :integer
#  indirect_associations_as_through_count :integer
#  name                                   :string
#  nature                                 :integer
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  origin_model_id                        :integer
#  source_association_id                  :integer
#  terminus_model_id                      :integer
#  through_association_id                 :integer
#
class Association < ApplicationRecord
  enum nature: { "direct" => 0, "indirect" => 1 }

  # Direct associations

  belongs_to :through_association,
             class_name: "Association",
             counter_cache: :indirect_associations_as_through_count,
             optional: true

  has_many   :indirect_associations_as_through,
             class_name: "Association",
             foreign_key: "through_association_id",
             dependent: :destroy

  belongs_to :source_association,
             class_name: "Association",
             counter_cache: :indirect_associations_as_source_count,
             optional: true

  has_many   :indirect_associations_as_source,
             class_name: "Association",
             foreign_key: "source_association_id",
             dependent: :destroy

  belongs_to :indirect_terminus_model,
             class_name: "Model",
             foreign_key: "terminus_model_id",
             counter_cache: :indirect_terminating_associations_count,
             optional: true

  belongs_to :indirect_origin_model,
             class_name: "Model",
             foreign_key: "origin_model_id",
             counter_cache: :indirect_originating_associations_count,
             optional: true

  belongs_to :direct_terminus_model,
             class_name: "Model",
             foreign_key: "terminus_model_id",
             counter_cache: :direct_terminating_associations_count,
             optional: true

  belongs_to :direct_origin_model,
             class_name: "Model",
             foreign_key: "origin_model_id",
             counter_cache: :direct_originating_associations_count,
             optional: true

  belongs_to :terminus_model,
             class_name: "Model",
             counter_cache: :terminating_associations_count

  belongs_to :origin_model,
             class_name: "Model",
             counter_cache: :originating_associations_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
