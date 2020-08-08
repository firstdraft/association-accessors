class AddClassifiedNameToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :class_name, :string
  end
end
