
class User < ActiveRecord::Base
  def tests_with_level(current_level)
    Test.joins('JOIN results ON tests.id = results.test_id').where( results: { user_id: id }, level: current_level )
  end
end

