class AddJoinTableModelsCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :join_models_count, :integer, default: 0
  end
end
