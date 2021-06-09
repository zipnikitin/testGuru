class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.references :user, foreign_key: true
      t.string :tittle
      t.integer :level, default: 1, null: false

      t.timestamps
    end
  end
end
