class CreateDirectAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :direct_associations do |t|
      t.string :foreign_key
      t.string :name
      t.integer :origin_model_id
      t.integer :terminus_model_id

      t.timestamps
    end
  end
end
