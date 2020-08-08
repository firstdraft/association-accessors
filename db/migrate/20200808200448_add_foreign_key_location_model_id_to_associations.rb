class AddForeignKeyLocationModelIdToAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :associations, :foreign_key_location_model, null: true, foreign_key: { to_table: :models }
  end
end
