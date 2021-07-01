class QuestionsController < ApplicationController
  before_action :test_search

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def index
    render plain: @test.questions.pluck(:tittle)
  end

  def show
    render plain: @question.body.inspect
  end
  
  def new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render plain: @question.body.inspect
    end
  end

  def destroy
    @question.delete

    render plain: '<%= @test.questions.inspect %> удален'
  end

  def test_search
    @test = Test.find(params[:test_id])
  end

  private

  def question_not_found
    render plain: "Вопрос не найден"
  end

end
