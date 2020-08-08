class AddOriginatingDirectAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :originating_direct_associations_count, :integer
  end
end
