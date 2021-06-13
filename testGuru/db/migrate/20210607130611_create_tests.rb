class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
  t.string :tittle, null: false
  t.integer :level, default: 1, null: false
  t.references :author, null: false, foreign_key: { to_table: :user }
  t.references :category, null: false, foreign_key: true

  t.timestamps
    end
  end
end
