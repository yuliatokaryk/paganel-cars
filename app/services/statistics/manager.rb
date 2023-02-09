# frozen_string_literal: true

module Statistics
  class Manager
    def initialize(total_quantity:, params: {})
      @total_quantity = total_quantity
      @params = params
    end

    def call
      statistic_record = Statistic.find_by(search_rules: @params)

      if statistic_record
        statistic_record.requests_quantity = statistic_record.requests_quantity + 1
      else
        statistic_record = Statistic.create(search_rules: @params, requests_quantity: 1)
      end

      statistic_record.total_quantity = @total_quantity
      statistic_record.save!
    end
  end
end
