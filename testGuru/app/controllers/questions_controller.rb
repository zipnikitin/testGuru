class QuestionsController < ApplicationController
  before_action :test_search, only: [:index, :create]
  before_action :question_search, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def test_search
    @test = Test.find(params[:test_id])
  end

  def question_search
    @question = Question.find(params[:id])
  end

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
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    @question.destroy

    redirect_to action: :index
  end

  private

  def question_not_found
    render plain: "Вопрос не найден"
  end

end
