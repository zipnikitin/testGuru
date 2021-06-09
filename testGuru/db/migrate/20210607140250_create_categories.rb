class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.references :test, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
