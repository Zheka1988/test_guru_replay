class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user#, class_name: "User", foreign_key: :author_id
  
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users


  # has_many :traveled_tests

  def self.by_category(title)
    id = Category.find_by(title: title).id
    where(category_id: 1).order(title: :desc).pluck(:title)
    
  end
  
  # scope :by_category, ->(title) do 
  #   joins(:category).where(categories: { title: title }).order(title: :desc)
  # end

  # def self.with_category(title)
  #   by_category(title).pluck(:title)
  # end
end
