# require 'digest/sha1' 

class User < ApplicationRecord
  # include Auth 

  # has_many :own_tests, class_name: 'Test', dependent: :nullify
  # has_many :tests

  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  scope :tests_by_level, ->(level) { tests.where(level: level)}
  
  validates :email, presence: true, uniqueness: true

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end  
end
