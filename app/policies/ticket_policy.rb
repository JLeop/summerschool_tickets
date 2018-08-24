class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
    # - user:   the `current_user` signed in with Devise.
    # - record: the restaurant passed to the `authorize` method in controller
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def assign_update?
    user_is_ta?
  end

  def status_solved?
    user_is_ta?
  end

  private

  def user_is_owner_or_admin? # owner is always the student. TAs can create new tickets however.
    if user.nil?
    else
      record.student == user || user.admin
    end
    # user is current_user in the policy file.
  end

  def user_is_ta?
    user.ta == true
  end
end
