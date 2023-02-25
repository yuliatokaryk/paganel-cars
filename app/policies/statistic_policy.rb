# frozen_string_literal: true

class StatisticPolicy < ApplicationPolicy
  def initialize(user, _statistic)
    @user = user
  end

  def index?
    true if @user.try(:admin?)
  end

  def destroy_all?
    index?
  end
end
