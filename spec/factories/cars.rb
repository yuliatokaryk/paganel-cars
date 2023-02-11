# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model(make_of_model: make) }
    year { Faker::Vehicle.year }
    odometer { Faker::Vehicle.mileage }
    price { Faker::Number.within(range: 1000..100_000) }
    description { Faker::Lorem.sentence(word_count: 7) }
    views { Faker::Number.within(range: 1..50) }

    trait :bmw do
      make { 'BMW' }
      year { 2009 }
      price { 100_00 }
    end

    trait :byd do
      make { 'BYD' }
      model { 'Seal' }
      year { 2012 }
      price { 135_00 }
    end

    trait :audi do
      make { 'Audi' }
      year { 2020 }
      price { 180_00 }
    end
  end
end
