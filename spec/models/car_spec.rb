# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car do
  let(:car) { create(:car) }

  it 'is valid with valid attributes' do
    expect(car).to be_valid
  end

  it 'is invalid without a make' do
    car.make = nil
    expect(car).not_to be_valid
  end

  it 'is invalid without a valid make' do
    car.make = Faker::Alphanumeric.alpha(number: 51)
    expect(car).not_to be_valid
  end

  it 'is invalid without a model' do
    car.model = nil
    expect(car).not_to be_valid
  end

  it 'is invalid without a valid model' do
    car.model = Faker::Alphanumeric.alpha(number: 51)
    expect(car).not_to be_valid
  end

  it 'is invalid without a year' do
    car.year = nil
    expect(car).not_to be_valid
  end

  it 'is invalid with a year greater than 2023' do
    car.year = 2025
    expect(car).not_to be_valid
  end

  it 'is invalid with a year less than 1990' do
    car.year = 1989
    expect(car).not_to be_valid
  end

  it 'is invalid without an odometer' do
    car.odometer = nil
    expect(car).not_to be_valid
  end

  it 'is invalid with a negative odometer' do
    car.odometer = -5
    expect(car).not_to be_valid
  end

  it 'is invalid without a price' do
    car.price = nil
    expect(car).not_to be_valid
  end

  it 'is invalid with a price less than 0' do
    car.price = -5
    expect(car).not_to be_valid
  end

  describe '.name' do
    it 'returns make and model of the car' do
      expect(car.name).to eq("#{car.make} #{car.model}")
    end
  end
end
