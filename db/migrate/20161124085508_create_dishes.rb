class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.references :core, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
