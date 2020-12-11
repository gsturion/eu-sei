class ClassroomChannel < ApplicationCable::Channel
  def subscribed
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    classroom = Classroom.find(1)
    puts classroom.id
    stream_from classroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
