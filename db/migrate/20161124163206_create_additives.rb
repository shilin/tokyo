class CreateAdditives < ActiveRecord::Migration
  def change
    create_table :additives do |t|
      t.references :dish, index: true, foreign_key: true
      t.references :addable, index: true 
      t.integer :multiplier

      t.timestamps null: false
    end
  end
end
