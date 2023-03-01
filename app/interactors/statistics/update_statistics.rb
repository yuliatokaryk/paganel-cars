# frozen_string_literal: true

module Statistics
  class UpdateStatistics
    include Interactor

    def call
      statistic_record = Statistic.find_by(search_rules: context.params)

      if statistic_record
        statistic_record.update(requests_quantity: statistic_record.requests_quantity + 1,
                                total_quantity: context.total_quantity)
      else
        Statistic.create(search_rules: context.params, requests_quantity: 1, total_quantity: context.total_quantity)
      end
    end
  end
end
