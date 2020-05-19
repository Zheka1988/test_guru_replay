class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    return [] unless @test_passage.successfully?
    Badge.all.select do |badge|
      send badge.rule, badge
    end
  end

  private
  # за прохождение всех тестов определенной категории

  def category_complete(badge)
    cat_id = Category.find_by(title: badge.parametr).id
    number_tests = Test.where(category_id: cat_id).count
    if number_tests && number_tests > 0
      number_tests == TestPassage.where(user_id: @user.id, test_result: true, test_id: Test.where(category_id: cat_id).ids).distinct.pluck(:test_id).count
    end
  end

# --------------------------------------------------------------
  # за прохождение теста с первой попытки
  def first_try(badge)
    @user.tests.where(id: @test.id).count == 1
  end
#---------------------------------------------------------------

  # за прохождение всех тестов определенного уровня
  def level_complete(badge)
    number_tests = Test.where(level: badge.parametr.to_i).count
    if number_tests && number_tests > 0
      number_tests  == TestPassage.where(user_id: @user.id, test_result: true, test_id: Test.where(level: badge.parametr.to_i).ids).distinct.pluck(:test_id).count
    end
  end

end
