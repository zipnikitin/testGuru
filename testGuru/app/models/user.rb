
class User < ActiveRecord::Base
<<<<<<< Updated upstream
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id"

  def tests_with_level(current_level)
    Test.joins(:results)
      .where(results: { user_id: id })
      .where(tests: { level: current_level })
=======
  def tests_with_level(current_level)
    Test.joins('JOIN results ON tests.id = results.test_id').where( results: { user_id: id }, level: current_level )
>>>>>>> Stashed changes
  end
end

