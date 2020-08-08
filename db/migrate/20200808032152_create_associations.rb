class CreateAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :associations do |t|
      t.string :name
      t.integer :source_association_id
      t.integer :through_association_id
      t.integer :origin_model_id
      t.integer :terminus_model_id
      t.string :foreign_key
      t.integer :nature

      t.timestamps
    end
  end
end
