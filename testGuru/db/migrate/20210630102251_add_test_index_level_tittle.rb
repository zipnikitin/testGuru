class AddTestIndexLevelTittle < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, [:tittle, :level], unique: true
  end
end