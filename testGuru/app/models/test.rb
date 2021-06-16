class Test < ActiveRecord::Base
  def self.tests_named(category_name)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(level: category_name ).order(type: :desc)
  end
end