class AddForeignKeyLocationsCountToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :foreign_key_locations_count, :integer, default: 0
  end
end
