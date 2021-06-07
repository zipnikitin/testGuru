class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :aid
      t.references :number, foreign_key: true
      t.string :body
      t.correct :integer, :default => true

      t.timestamps
    end
  end
end
