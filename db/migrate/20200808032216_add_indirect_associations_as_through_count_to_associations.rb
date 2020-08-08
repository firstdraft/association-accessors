class AddIndirectAssociationsAsThroughCountToAssociations < ActiveRecord::Migration[6.0]
  def change
    add_column :associations, :indirect_associations_as_through_count, :integer
  end
end
