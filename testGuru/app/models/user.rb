class User < ActiveRecord::Base
  attr_accessor :tests

  def tests_used_to_solve(current_level)
    @tests.each do |test|
      puts ('Тесты ' + test.level.to_s + ' уровня: ' + test.title.to_s) if test.level == current_level
    end
  end
end