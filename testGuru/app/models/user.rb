
class User < ActiveRecord::Base
  has_many :tests, foreign_key: :author_id, class_name: 'Test'
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  def tests_with_level(current_level)
    Test.joins(:result)
      .where(results: { user_id: id })
      .where(level: current_level)
  end
end

