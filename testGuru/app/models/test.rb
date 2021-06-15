class Test < ActiveRecord::Base
  def self.tests_with_category(current_level)
    Test.joins('Join categories ON tests.category_id = categories.id').where('categories.type = ?',
    type = current_level).order(type: :desc)
  end
end