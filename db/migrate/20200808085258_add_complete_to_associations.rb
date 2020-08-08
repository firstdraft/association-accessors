class AddCompleteToAssociations < ActiveRecord::Migration[6.0]
  def change
    add_column :associations, :complete, :boolean, default: false
  end
end
