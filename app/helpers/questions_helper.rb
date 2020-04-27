module QuestionsHelper
  def question_header(resource)
    resource.new_record? ? @test.title : resource.test.title
  end
end
