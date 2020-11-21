class ClassroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
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
