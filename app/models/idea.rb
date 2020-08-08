# == Schema Information
#
# Table name: ideas
#
#  id                 :bigint           not null, primary key
#  associations_count :integer          default(0)
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_ideas_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Idea < ApplicationRecord
  # Direct associations

  has_many   :models,
             dependent: :destroy

  belongs_to :user

  # Indirect associations

  has_many :associations, through: :models, source: :originating_associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
