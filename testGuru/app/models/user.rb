
class User < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, source: :test, foreign_key: :author_id

  def tests_with_level(current_level)
    Test.joins(:results)
      .where(results: { user_id: id })
      .where(tests: { level: current_level })
  end
end

