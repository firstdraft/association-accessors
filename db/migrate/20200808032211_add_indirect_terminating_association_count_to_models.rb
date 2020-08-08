class AddIndirectTerminatingAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :indirect_terminating_associations_count, :integer, default: 0
  end
end
