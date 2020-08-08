# == Schema Information
#
# Table name: ideas
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Idea < ApplicationRecord
  # Direct associations

  has_many   :models,
             dependent: :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
