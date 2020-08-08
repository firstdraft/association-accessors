class CreateIndirectAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :indirect_associations do |t|
      t.string :name
      t.integer :source_association_id
      t.string :source_association_type
      t.integer :through_association_id
      t.string :through_association_type
      t.integer :origin_model_id
      t.integer :terminus_model_id

      t.timestamps
    end
  end
end
