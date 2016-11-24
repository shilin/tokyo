class AddPolimorphicToAdditives < ActiveRecord::Migration
  def change
    add_column :additives, :addable_type, :string
    add_index :additives, [:addable_id, :addable_type]
    remove_index :additives, :addable_id
  end
end
