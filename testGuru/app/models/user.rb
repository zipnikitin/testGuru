
class User < ActiveRecord::Base
  has_many :tests, class_name: 'Test', foreign_key: :author_id

  def tests_with_level(current_level)
    Test.joins(:tests_users)
      .where(tests_users: { user_id: id })
      .where(tests: { level: current_level })
  end
end

