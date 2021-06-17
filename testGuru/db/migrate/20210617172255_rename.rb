class Rename < ActiveRecord::Migration[6.1]
def self.up
    rename_column :categories, :type, :title
  end
end
