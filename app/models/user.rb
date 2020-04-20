class User < ApplicationRecord
  # has_many :traveled_tests
  has_many :tests

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  def tests_by_level(level)
    # Test.joins(:traveled_tests).where(level: level, 
    #   traveled_tests: { user_id: self.id })   
    tests.where(level: level)
  end

end
