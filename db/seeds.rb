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
