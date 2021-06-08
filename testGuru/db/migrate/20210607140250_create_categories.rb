class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :type
      t.integer :level, default: 1, null: false

      t.timestamps
    end
  end
end
