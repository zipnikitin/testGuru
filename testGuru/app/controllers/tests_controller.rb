class TestsController < ApplicationController
  before_action :test_search, only: [:show, :update, :edit, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index
    @test = Test.all
  end

  def show
    @questions = @test.questions
  end
  
  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.result(@test)
  end

  private

  def test_params
    params.require(:test).permit(:tittle, :level, :category_id, :author_id) 
  end

  def test_not_found
    render plain: "Тест не найден"
  end

  def test_search
    @test = Test.find(params[:id])
  end

end
