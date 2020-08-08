class AddAssociationsCountToIdeas < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :associations_count, :integer, default: 0
  end
end
