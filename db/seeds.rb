classroom = Classroom.create!(name: "A", year: 1)


User.create!(
  classroom_id: 1,
  email: "darci@yahoo.com",
  password: 123456,
  name: "Darci",
  is_teacher: false
)

User.create!(
  classroom_id: 1,
  email: "maria@eusei.com",
  password: 123456,
  name: "Maria",
  is_teacher: true,
  subject: "Matematica"
)

question = Question.create!(content: "2 + 2", lesson: 1, classroom_id: 1, user_id: 6)

alternative1 = Alternative.create!(content: "4", is_correct: true, question_id: 1)
alternative2 = Alternative.create!(content: "2", is_correct: false, question_id: 2)