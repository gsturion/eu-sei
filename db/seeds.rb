classroom = Classroom.create!(name: "A", year: 1)

teacher = User.create!(
  classroom_id: classroom.id,
  email: "teacher@eusei.com",
  password: 123456,
  name: "Teacher",
  is_teacher: true,
  subject: "matematica"
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

teacher_2 = User.create!(classroom_id: classroom.id,email: "teacher2@eusei.com",password: 123456,name: "Teacher 2", is_teacher: true,subject: "Biologia")
question_4 = Question.create!(content: "Quantos ATPs são formados no Ciclo de Krebs?",lesson: 1,classroom_id: classroom.id,user_id: teacher_2.id,released_at: DateTime.now)
Alternative.create!(content: "32", is_correct: false, question_id: question_4.id)
Alternative.create!(content: "6", is_correct: true, question_id: question_4.id)
