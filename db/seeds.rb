User.create!(name: 'Vova', password: '123')
User.create!(name: 'Kolya', password: '123')
User.create!(name: 'Vika', password: '123')

user = User.first

Category.create!(title: "Backend")
Category.create!(title: "Frontend")
Category.create!(title: "Mobile development")

Test.create!(title: 'Ruby', level: 6, 
            category_id: Category.find_by(title: 'Backend').id, author_id: user.id)
Test.create!(title: 'C++', level: 5, 
            category_id: Category.find_by(title: 'Backend').id, author_id: user.id)
Test.create!(title: 'HTML', #level: 1, 
            category_id: Category.find_by(title: 'Frontend').id, author_id: user.id)
Test.create!(title: 'CSS', level: 2, 
            category_id: Category.find_by(title: 'Frontend').id, author_id: user.id)
Test.create!(title: 'Java', level: 4, 
            category_id: Category.find_by(title: 'Mobile development').id, author_id: user.id)

Question.create!(body: 'HTML this?',  test_id: Test.find_by(title: 'HTML').id)
Question.create!(body: 'C++ this?',  test_id: Test.find_by(title: 'C++').id)
Question.create!(body: 'Ruby this?',  test_id: Test.find_by(title: 'Ruby').id)
Question.create!(body: 'Rails this?',  test_id: Test.find_by(title: 'Ruby').id)

questions = Question.all

4.times do |i|
  Answer.create(body: 'Verno', question_id: questions[i].id, correct: true)
  Answer.create(body: 'Neverno', question_id: questions[i].id)  
end

# def randomizer
#   Question.offset(rand(Question.count)).first.id
# end

# 10.times do |i| 
#   question_id = randomizer
#   Answer.create(body: 'Verno', question_id: question_id, correct: true)
#   Answer.create(body: 'Neverno', question_id: question_id)
# end
