class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :qid
      t.integer :number
      t.string :body
      t.references :level, foreign_key: true

      t.timestamps
    end
  end
end
