# == Schema Information
#
# Table name: associations
#
#  id                                     :bigint           not null, primary key
#  finished                               :boolean          default(FALSE)
#  foreign_key                            :string
#  indirect_associations_as_source_count  :integer
#  indirect_associations_as_through_count :integer
#  name                                   :string
#  nature                                 :integer
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  foreign_key_location_model_id          :bigint
#  idea_id                                :bigint           not null
#  join_model_id                          :bigint
#  origin_model_id                        :bigint
#  source_association_id                  :bigint
#  terminus_model_id                      :bigint
#  through_association_id                 :bigint
#
# Indexes
#
#  index_associations_on_foreign_key_location_model_id  (foreign_key_location_model_id)
#  index_associations_on_idea_id                        (idea_id)
#  index_associations_on_join_model_id                  (join_model_id)
#  index_associations_on_origin_model_id                (origin_model_id)
#  index_associations_on_source_association_id          (source_association_id)
#  index_associations_on_terminus_model_id              (terminus_model_id)
#  index_associations_on_through_association_id         (through_association_id)
#
# Foreign Keys
#
#  fk_rails_...  (foreign_key_location_model_id => models.id)
#  fk_rails_...  (idea_id => ideas.id)
#  fk_rails_...  (join_model_id => models.id)
#  fk_rails_...  (origin_model_id => models.id)
#  fk_rails_...  (source_association_id => associations.id)
#  fk_rails_...  (terminus_model_id => models.id)
#  fk_rails_...  (through_association_id => associations.id)
#
class Association < ApplicationRecord
  enum nature: { 'direct' => 0, 'indirect' => 1 }

  cattr_accessor :form_steps do
    %w[origin_model terminus_model nature foreign_key_location foreign_key join_table through source name]
  end

  attr_accessor :form_step

  # Direct associations

  belongs_to :idea, counter_cache: true

  belongs_to :foreign_key_location_model,
             class_name: 'Model',
             counter_cache: :foreign_key_locations_count,
             optional: true

  belongs_to :join_model,
             class_name: 'Model',
             counter_cache: :join_models_count,
             optional: true

  belongs_to :through_association,
             class_name: 'Association',
             counter_cache: :indirect_associations_as_through_count,
             optional: true

  has_many   :indirect_associations_as_through,
             class_name: 'Association',
             foreign_key: 'through_association_id',
             dependent: :destroy

  belongs_to :source_association,
             class_name: 'Association',
             counter_cache: :indirect_associations_as_source_count,
             optional: true

  has_many   :indirect_associations_as_source,
             class_name: 'Association',
             foreign_key: 'source_association_id',
             dependent: :destroy

  belongs_to :indirect_terminus_model,
             class_name: 'Model',
             foreign_key: 'terminus_model_id',
             counter_cache: :indirect_terminating_associations_count,
             optional: true

  belongs_to :indirect_origin_model,
             class_name: 'Model',
             foreign_key: 'origin_model_id',
             counter_cache: :indirect_originating_associations_count,
             optional: true

  belongs_to :direct_terminus_model,
             class_name: 'Model',
             foreign_key: 'terminus_model_id',
             counter_cache: :direct_terminating_associations_count,
             optional: true

  belongs_to :direct_origin_model,
             class_name: 'Model',
             foreign_key: 'origin_model_id',
             counter_cache: :direct_originating_associations_count,
             optional: true

  belongs_to :terminus_model,
             class_name: 'Model',
             counter_cache: :terminating_associations_count,
             optional: true

  belongs_to :origin_model,
             class_name: 'Model',
             counter_cache: :originating_associations_count,
             optional: true

  # Indirect associations

  # Validations

  with_options if: -> { form_step == 'origin_model' } do
    validates :origin_model, presence: true
  end

  with_options if: -> { form_step == 'terminus_model' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
  end

  with_options if: -> { form_step == 'nature' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
    validates :nature, presence: true
  end

  with_options if: -> { form_step == 'foreign_key_location' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
    validates :nature, presence: true
    validates :foreign_key_location_model, presence: true
  end

  with_options if: -> { form_step == 'foreign_key' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
    validates :nature, presence: true
    validates :foreign_key_location_model, presence: true
    validates :foreign_key, presence: true
  end

  with_options if: -> { form_step == 'join_table' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
    validates :nature, presence: true
    validates :join_model, presence: true
  end

  with_options if: -> { form_step == 'through' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
    validates :nature, presence: true
    validates :join_model, presence: true
    validates :through_association, presence: true
  end

  with_options if: -> { form_step == 'source' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
    validates :nature, presence: true
    validates :join_model, presence: true
    validates :through_association, presence: true
    validates :source_association, presence: true
  end

  with_options if: -> { form_step == 'name' } do
    validates :origin_model, presence: true
    validates :terminus_model, presence: true
    validates :nature, presence: true
    validates :name, presence: true, uniqueness: { scope: %i[origin_model_id finished] }
  end

  scope :finished, -> { where(finished: true) }

  before_validation :normalize_foreign_key
  before_validation :normalize_name

  after_validation :set_finished

  def to_s
    name
  end

  def normalize_foreign_key
    self.foreign_key = foreign_key.try(:parameterize, separator: '_')
  end

  def normalize_name
    self.name = name.try(:parameterize, separator: '_')
  end

  def set_finished
    self.finished = true if name.present?
  end

  def options_for_nature_select
    [
      ['direct', "Directly: the ID of the #{origin_model.singular_name} is stored in some column of the #{terminus_model.singular_name}, or vice versa."],
      ['indirect', "Indirectly: the #{origin_model.singular_name} and the #{terminus_model.singular_name} both have an association to a third, joining, record."]
    ]
  end
  
end
