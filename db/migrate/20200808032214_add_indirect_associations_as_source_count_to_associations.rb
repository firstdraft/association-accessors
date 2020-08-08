class AddIndirectAssociationsAsSourceCountToAssociations < ActiveRecord::Migration[6.0]
  def change
    add_column :associations, :indirect_associations_as_source_count, :integer, default: 0
  end
end
