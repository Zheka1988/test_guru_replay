class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_count_answer, on: :create

  private
  def validate_count_answer
    errors.add(:question_id) if question.answers.count >= 4
  end
end
