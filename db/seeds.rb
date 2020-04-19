User.create!(name: 'Vova', password: '123')
User.create!(name: 'Kolya', password: '123')
User.create!(name: 'Vika', password: '123')

users_object = User.all


3.times do |i|
  Category.create! title: "Category_#{i+1}"
end

5.times do |i|
  Test.create! title: "Test_#{i+1}", level: i, 
    category_id: Category.find(rand(1..3)).id
end

test_objects = Test.all

question_objects = Array.new(5) do |i|
  Question.create!(body: "Question ##{i+1}", test_id: test_objects[i].id )
end

5.times do |i|
  Answer.create!(question_id: question_objects[i].id)
end

3.times do |i|
  TraveledTest.create!(user_id: users_object[i].id, test_id: test_objects[i].id )
end
  TraveledTest.create!(user_id: users_object[0].id, test_id: test_objects[1].id )
