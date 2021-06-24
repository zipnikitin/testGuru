
class User < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :passed_tests, through: :results, dependent: :destroy
  has_many :tests, class_name: 'Test', foreign_key: :author_id

  def tests_with_level(current_level)
    Test.joins(:results)
      .where(results: { tested_user_id: id })
      .where(tests: { level: current_level })
  end
end

