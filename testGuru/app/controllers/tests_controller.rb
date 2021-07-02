class TestsController < ApplicationController
  before_action :test_search, only: [:index, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :test_not_found

  def index
    @test = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end
  
  def new
    @test = Test.new
  end

  def create
    @test = @test.new(params[:test])

    if test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(params[:test])
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to @test
  end

  private

  def test_not_found
    render plain: "Тест не найден"
  end

end
