class AddIndirectOriginatingAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :indirect_originating_associations_count, :integer
  end
end
