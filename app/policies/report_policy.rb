class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
    true
  end
  def new?
    true
  end
  def edit
    true
  end
  def update?
    true
  end
  def destroy?
    report.person == user || user.has_role?(:department_admin, :any)
  end
end
