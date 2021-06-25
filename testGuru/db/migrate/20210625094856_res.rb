class Res < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: { to_table: :user }
      t.references :test, null: false, foreign_key: { to_table: :test }

      t.timestamps
    end
  end
end
