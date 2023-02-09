# frozen_string_literal: true

class StatisticsController < ApplicationController
  before_action :authorize_access

  def index
    @statistics = Statistic.paginate(page: params[:page], per_page: 10)
  end

  def destroy_all
    Statistic.delete_all

    redirect_to statistics_path
  end

  private

  def authorize_access
    authorize Statistic
  end
end
