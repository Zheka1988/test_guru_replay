class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  
  before_validation :before_validation_set_first_question, on: :create
  
  def passed?
    result >= 85 ? self.update(success: true) : false
  end
    
  def completed?
    current_question.nil?
  end
  
  def total_questions_count
    test.questions.count
  end
  
  def progress
    (self.number_current_question / self.test.questions.count.to_f)
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.current_question = next_question
    save!
  end

  def result
    (correct_questions.to_f / test.questions.count) * 100
  end  

  def number_current_question
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end
  
  def successfully?
    completed? && passed?
  end

  def finish!
    self.current_question = nil
  end

  def time_left
    (expires_at - Time.current).to_i
  end

  def time_over?
    expires_at < Time.now
  end

  private
  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present? 
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def expires_at
    created_at + test.timer.minutes
  end

end
