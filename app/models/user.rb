class User < ApplicationRecord
  has_many :tests
  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  scope :tests_by_level, ->(level) { tests.where(level: level)}

  validates :name, presence: true
  validates :password, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
