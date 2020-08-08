class AddTerminatingAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :terminating_associations_count, :integer
  end
end
