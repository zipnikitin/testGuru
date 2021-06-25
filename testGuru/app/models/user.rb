
class User < ActiveRecord::Base
  has_many :results, dependent: :destroy, foreign_key: :author_id, class_name: 'Test'
  has_many :tests, source: :test, through: :results, class_name: 'Test'

  def tests_with_level(current_level)
    Test.joins(:results)
      .where(results: { user_id: id })
      .where(tests: { level: current_level })
  end
end

