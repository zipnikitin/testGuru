class User < ActiveRecord::Base
  def tests_with_level(current_level)
    Test.joins('JOIN statistics ON tests.id = statistics.tests.id').where( level: current_level )
  end
end