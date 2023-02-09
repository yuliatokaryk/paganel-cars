# frozen_string_literal: true

module SearchHistory
  # Service to save users searches history
  class Manager
    def initialize(params:, user:)
      @params = params
      @user = user
    end

    def call
      request_date = Date.today

      MySearch.create(search_rules: @params, date: request_date, user_id: @user)
      MySearch.where(user_id: @user).first.delete if MySearch.where(user_id: @user).count > 50
    end
  end
end
