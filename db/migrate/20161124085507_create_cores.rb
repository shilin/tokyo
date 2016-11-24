class CreateCores < ActiveRecord::Migration
  def change
    create_table :cores do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
