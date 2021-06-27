
class User < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id"

  def tests_with_level(current_level)
    Test.joins('JOIN results ON tests.id = results.test_id').where( results: { user_id: id }, level: current_level )
  end
end

