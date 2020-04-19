class User < ApplicationRecord
  has_many :traveled_tests

  def tests_by_level(level)
    Test.joins(:traveled_tests).where(level: level, 
      traveled_tests: { user_id: self.id })   
  end

end
