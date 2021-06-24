class Results < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :tested_user, null: false, foreign_key: { to_table: :user }
      t.references :passed_test, null: false, foreign_key: { to_table: :test }

      t.timestamps
    end
  end
end