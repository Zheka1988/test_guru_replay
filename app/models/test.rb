class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages


  scope :by_category, ->(title) { joins(:category)
                                  .where(categories: { title: title })
                                  .order(title: :desc)
                                }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true
  validates :level, presence: true, 
                    numericality: { only_integer: true, greater_than_or_equal_to: 1 } 
  validates :author, presence: true
  validate :one_title_one_level

  def self.with_category(title)
    by_category(title).pluck(:title)
  end

  def one_title_one_level
    errors.add(:title) if self.class.where(":level = ? AND :title = ?", level, title).count > 1
  end

end
