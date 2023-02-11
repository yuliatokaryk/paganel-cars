# frozen_string_literal: true

FactoryBot.define do
  factory :my_search do
    search_rules { { make: 'x', model: 'x' } }
    date { Faker::Date.between(from: '2020-09-23', to: '2023-02-01') }
    association :user
  end
end
