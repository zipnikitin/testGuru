class User < ActiveRecord::Base
  def tests_with_level(current_level)
    User.joins('JOIN tests ON user.id = tests.id').where(level: current_level )
  end
end