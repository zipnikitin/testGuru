
class User < ActiveRecord::Base
  def tests_with_level(current_level)
    Test.joins('JOIN users ON tests.author_id = users.id').where( level: current_level )
  end
end

