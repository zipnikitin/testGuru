class AnswersController < ApplicationController
  before_action :question_search, only: [:new, :create]
  before_action :answer_search, only: [:show, :destroy, :edit, :update]

  def show
  end
  
  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def answer_search
    @answer = Answer.find(params[:id])
  end

  def question_search
    @question = Question.find(params[:question_id])
  end

end
