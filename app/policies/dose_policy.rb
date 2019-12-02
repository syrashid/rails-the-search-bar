class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.cocktail.user == user
  end

  def destroy?
    record.cocktail.user == user
  end
end
