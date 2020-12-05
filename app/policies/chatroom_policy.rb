class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def show?
    user.is_teacher || user.classroom == record.classroom
  end
end
