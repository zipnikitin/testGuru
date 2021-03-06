class QuestionsController < ApplicationController
  before_action :test_search, only: [:new, :create]
  before_action :question_search, only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :question_not_found

  def show
  end
  
  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def test_search
    @test = Test.find(params[:test_id])
  end

  def question_search
    @question = Question.find(params[:id])
  end

  def question_not_found
    render plain: "Вопрос не найден"
  end

end
