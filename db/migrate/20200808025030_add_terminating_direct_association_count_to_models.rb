class AddTerminatingDirectAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :terminating_direct_associations_count, :integer
  end
end
