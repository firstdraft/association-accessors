class CreateAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :associations do |t|
      t.string :name
      t.references :source_association, foreign_key: { to_table: :associations }, null: true
      t.references :through_association, foreign_key: { to_table: :associations }, null: true
      t.references :origin_model, foreign_key: { to_table: :models }, null: true
      t.references :terminus_model, foreign_key: { to_table: :models }, null: true
      t.string :foreign_key
      t.integer :nature
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
