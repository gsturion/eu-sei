classroom = Classroom.create!(name: "A", year: 1)

teacher = User.create!(
  classroom_id: classroom.id,
  email: "teacher@eusei.com",
  password: 123456,
  name: "Teacher",
  is_teacher: true,
  subject: "Matematica"
)

student = User.create!(
  classroom_id: classroom.id,
  email: "student@eusei.com",
  password: 123456,
  name: "Student",
  is_teacher: false
)

question_1 = Question.create!(
  content: "2 + 2",
  lesson: 1,
  classroom_id: classroom.id,
  user_id: teacher.id
)

Alternative.create!(content: "4", is_correct: true, question_id: question_1.id)
Alternative.create!(content: "2", is_correct: false, question_id: question_1.id)

question_2 = Question.create!(
  content: "2 + 3",
  lesson: 1,
  classroom_id: classroom.id,
  user_id: teacher.id
)

Alternative.create!(content: "5", is_correct: true, question_id: question_2.id)
Alternative.create!(content: "7", is_correct: false, question_id: question_2.id)

question_3 = Question.create!(
  content: "2 + 5",
  lesson: 1,
  classroom_id: classroom.id,
  user_id: teacher.id,
  released_at: DateTime.now
)

Alternative.create!(content: "5", is_correct: true, question_id: question_3.id)
Alternative.create!(content: "7", is_correct: false, question_id: question_3.id)
