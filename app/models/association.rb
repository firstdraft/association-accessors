# == Schema Information
#
# Table name: associations
#
#  id                                     :integer          not null, primary key
#  complete                               :boolean
#  foreign_key                            :string
#  indirect_associations_as_source_count  :integer
#  indirect_associations_as_through_count :integer
#  name                                   :string
#  nature                                 :integer
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  idea_id                                :integer          not null
#  origin_model_id                        :integer
#  source_association_id                  :integer
#  terminus_model_id                      :integer
#  through_association_id                 :integer
#
# Indexes
#
#  index_associations_on_idea_id  (idea_id)
#
# Foreign Keys
#
#  idea_id  (idea_id => ideas.id)
#
class Association < ApplicationRecord
  enum nature: { "direct" => 0, "indirect" => 1 }

  cattr_accessor :form_steps do
  	%w(origin_model terminus_model nature foreign_key through source name)
  end

  attr_accessor :form_step

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
             counter_cache: :terminating_associations_count,
             optional: true

  belongs_to :origin_model,
             class_name: "Model",
             counter_cache: :originating_associations_count,
             optional: true

  # Indirect associations

  

  # Validations

  with_options if: -> { form_step == :origin_model } do |step|
    step.validates :origin_model, presence: true
  end

  with_options if: -> { form_step == :terminus_model } do |step|
    step.validates :origin_model, presence: true
    step.validates :terminus_model, presence: true
  end

  with_options if: -> { form_step == :nature } do |step|
    step.validates :origin_model, presence: true
    step.validates :terminus_model, presence: true
    step.validates :nature, presence: true
  end

  with_options if: -> { form_step == :foreign_key } do |step|
    step.validates :origin_model, presence: true
    step.validates :terminus_model, presence: true
    step.validates :nature, presence: true
    step.validates :foreign_key, presence: true
  end

  with_options if: -> { form_step == :through } do |step|
    step.validates :origin_model, presence: true
    step.validates :terminus_model, presence: true
    step.validates :nature, presence: true
    step.validates :through_association, presence: true
  end

  with_options if: -> { form_step == :source } do |step|
    step.validates :origin_model, presence: true
    step.validates :terminus_model, presence: true
    step.validates :nature, presence: true
    step.validates :through_association, presence: true
    step.validates :source_association, presence: true
  end

  def to_s
    name
  end
end
