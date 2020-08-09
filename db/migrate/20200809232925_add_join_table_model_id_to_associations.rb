class AddJoinTableModelIdToAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :associations, :join_table_model, null: true, foreign_key: { to_table: :models }
  end
end
