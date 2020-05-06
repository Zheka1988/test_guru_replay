module QuestionsHelper
  def question_header(resource)
    resource.new_record? ? @test.title : resource.test.title
    if resource.new_record?
      "Cоздать новый #{@test.title} вопрос"
    else
      "Редактировать #{resource.test.title} вопрос"
    end    
  end
end
