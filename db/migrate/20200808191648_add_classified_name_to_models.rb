class AddClassifiedNameToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :classified_name, :string
  end
end
