class AddSingularNameToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :singular_name, :string
  end
end
