# frozen_string_literal: true

FactoryBot.define do
  factory :statistic do
    search_rules { { make: 'x', model: 'x' } }
    requests_quantity { 1 }
    total_quantity { 0 }
  end
end
