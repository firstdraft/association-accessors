# == Schema Information
#
# Table name: models
#
#  id                                      :bigint           not null, primary key
#  class_name                              :string
#  direct_originating_associations_count   :integer          default(0)
#  direct_terminating_associations_count   :integer          default(0)
#  foreign_key_locations_count             :integer          default(0)
#  indirect_originating_associations_count :integer          default(0)
#  indirect_terminating_associations_count :integer          default(0)
#  join_models_count                       :integer          default(0)
#  name                                    :string
#  originating_associations_count          :integer          default(0)
#  plural_name                             :string
#  singular_name                           :string
#  terminating_associations_count          :integer          default(0)
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  idea_id                                 :integer
#
No such command in 2.6.6 of ruby
