class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.references :dish, index: true, foreign_key: true

      t.references :ingredient, index: true, foreign_key: true

      t.integer :multiplier

      t.timestamps null: false
    end
  end
end
