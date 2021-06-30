class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true 

  validate :answer_limit_validation, on: :create

  scope :correct, -> { where(correct: true) }

  def answer_limit_validation
    errors.add(:question, message) if question.answers.count >= 4
  end
  
end
