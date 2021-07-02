module QuestionsHelper
  def question_header(question)
    @test_title = question.test.tittle

    if question.new_record? 
      "Новый вопрос#{@test_title}"
    else  
      "Изменить вопрос к тесту #{@test_title}"
    end
  end

  def current_year
    Date.current.year
  end

  def guthub_url(author, repo)
    link_to @test_title, "https://github.com/#{author}/#{repo}",  target: :_blank
  end
end
