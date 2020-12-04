class AlternativePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    user.is_teacher
  end

  def create?
    user.is_teacher
  end

  def show?
    true
  end

  def edit?
    record.question.user == user
  end

  def update?
    record.question.user == user
  end

  def destroy?
    record.question.user == user
  end
end
