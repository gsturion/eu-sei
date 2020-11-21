class ClassroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def feed?
    true
  end

  def dashboard?
    true
  end
end
