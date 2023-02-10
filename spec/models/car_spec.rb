# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car do
  let(:car) { build(:car) }

  it 'is valid with valid attributes' do
    expect(car).to be_valid
  end

  it 'is not valid without a make' do
    car.make = nil
    expect(car).not_to be_valid
  end

  it 'is not valid without a model' do
    car.model = nil
    expect(car).not_to be_valid
  end

  it 'is not valid without a year' do
    car.year = nil
    expect(car).not_to be_valid
  end

  it 'is not valid without a odometer' do
    car.odometer = nil
    expect(car).not_to be_valid
  end

  it 'is not valid without a price' do
    car.price = nil
    expect(car).not_to be_valid
  end

  describe '#create' do
    let(:car) { create(:car) }

    it 'is not valid without a valid make' do
      car.make = Faker::Alphanumeric.alpha(number: 51)
      expect(car).not_to be_valid
    end

    it 'is not valid without a valid model' do
      car.model = Faker::Alphanumeric.alpha(number: 51)
      expect(car).not_to be_valid
    end

    it 'is not valid with a year greater than 2023' do
      car.year = 2025
      expect(car).not_to be_valid
    end

    it 'is not valid with a year less than 1990' do
      car.year = 1989
      expect(car).not_to be_valid
    end

    it 'is not valid with a negative odometer' do
      car.odometer = -5
      expect(car).not_to be_valid
    end

    it 'is not valid with a price less than 0' do
      car.price = -5
      expect(car).not_to be_valid
    end
  end
end
