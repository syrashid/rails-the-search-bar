class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    verify_owner?
  end

  def destroy?
    verify_owner?
  end

  private

  def verify_owner?
    record.cocktail.user == user
  end
end
