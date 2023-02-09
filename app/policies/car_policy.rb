# frozen_string_literal: true

class CarPolicy < ApplicationPolicy
  def initialize(user, _record)
    @user = user
  end

  def create?
    true if user.admin?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end
end
