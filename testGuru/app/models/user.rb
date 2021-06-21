
class User < ActiveRecord::Base
  has_many :results
  has_many :tests, through: :results
  has_many :tests, foreign_key: :author_id, class_name: 'Test'

  def tests_with_level(current_level)
    Test.joins('JOIN results ON tests.id = results.test_id').where( results: { user_id: id }, level: current_level )
  end
end

