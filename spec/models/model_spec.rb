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
#  join_models_count                       :integer          default(0)
#  name                                    :string
#  originating_associations_count          :integer
#  plural_name                             :string
#  singular_name                           :string
#  terminating_associations_count          :integer
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  idea_id                                 :integer
#
No such command in 2.6.6 of ruby
