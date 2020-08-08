class AddDirectOriginatingAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :direct_originating_associations_count, :integer
  end
end
