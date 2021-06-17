class Statistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      
      t.timestamps
    end
  end
end
