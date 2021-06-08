class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :number
      t.string :body, null: false
      t.integer :level

      t.timestamps
    end
  end
end
