class AddPluralNameToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :plural_name, :string
  end
end
