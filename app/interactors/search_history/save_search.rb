# frozen_string_literal: true

module SearchHistory
  class SaveSearch
    include Interactor

    def call
      request_date = Time.zone.today

      MySearch.create(search_rules: context.params, date: request_date, user_id: context.user)
      MySearch.where(user_id: context.user).first.delete if MySearch.where(user_id: context.user).count > 50
    end
  end
end
