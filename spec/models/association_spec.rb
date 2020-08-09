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
No such command in 2.6.6 of ruby
