class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :traveled_tests

  # scope :by_category, ->(title) do 
  #   joins(:category).where(categories: { title: title }).order(title: :desc)
  # end

  # def self.with_category(title)
  #   by_category(title).pluck(:title)
  # end

  def self.by_category(title)
    id = Category.find_by(title: title).id
    where(category_id: 1).order(title: :desc).pluck(:title)
    
  end

end
