class AddIdeaIdToAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :associations, :idea, null: false, foreign_key: true
  end
end
