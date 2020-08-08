class AddTerminatingIndirectAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :terminating_indirect_associations_count, :integer
  end
end
