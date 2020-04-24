class User < ApplicationRecord
  has_many :tests

  has_many :own_tests, class_name: "Test", dependent: :nullify
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  scope :tests_by_level, ->(level) { tests.where(level: level)}

  validates :name, presence: true
  validates :password, presence: true
end
