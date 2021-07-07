
class Result < ActiveRecord::Base
  PASS_THRESHOLD = 85

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
    test_scores >= PASS_THRESHOLD
  end

  def test_scores
    (correct_questions.count.to_f / test.questions.size) * 100 
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    test.questions.index + 1
  end

  private

  def before_validation_set_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answers_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end

