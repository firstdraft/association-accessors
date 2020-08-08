class AddOriginatingAssociationCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :originating_associations_count, :integer
  end
end
