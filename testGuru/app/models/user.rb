
class User < ActiveRecord::Base
  has_many :passed_tests, foreign_key: :author_id, class_name: 'Test'
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  def tests_with_level(current_level)
    Test.joins(:results)
      .where(results: { user_id: id })
      .where(tests: { level: current_level })
  end
end

