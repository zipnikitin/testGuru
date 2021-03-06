
class User < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :authored_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, presence: true

  scope :tests_with_level, ->(current_level) do
    Test.joins(:results)
      .where(results: { user_id: id })
      .where(tests: { level: current_level })
  end

end

