class AddForeignKeyLocationModelIdToAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :associations, :foreign_key_location_model_id, null: false, foreign_key: true
  end
end
