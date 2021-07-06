
class Result < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    save
  end

  def test_passed?
    test_scores >= 85
  end

  def test_scores
    (correct_questions.count * 100) / test.questions.size
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    test.questions.index + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = next_question
  end

  def correct_answer?(answers_ids)
    correct_answers_count = correct_answers_count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answers_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end

