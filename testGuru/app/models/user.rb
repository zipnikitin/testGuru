class User < ActiveRecord::Base
  def tests_used_to_solve(current_level)
    User.joins('Join tests ON user.id = tests.id').where('tests.level = ?',
    level = current_level)
  end
end