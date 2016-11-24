class AddMultiplierToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :multiplier, :integer, default: 1
  end
end
