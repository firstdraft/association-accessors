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
