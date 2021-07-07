class AnswersController < ApplicationController
  before_action :result_search, only: [:show, :statistic, :update]

  def show; end

  def statistic; end

  def update
    @result.accept!(params[:answer_ids])
    if @result.completed?
      redirect_to stats_result_path(@result)
    else
      render :show
    end
  end

  private

  def result_search
    @result = Result.find(params[:id])
  end
end
