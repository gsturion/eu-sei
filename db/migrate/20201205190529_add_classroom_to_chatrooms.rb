class AddClassroomToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :classroom, null: false, foreign_key: true
  end
end
