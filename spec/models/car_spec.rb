# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car do
  it 'is valid with valid attributes' do
    car = described_class.new(make: 'BMW', model: 'X5', year: '2010', odometer: '250000', price: '12000')
    expect(car).to be_valid
  end

  it 'is not valid without a make' do
    car = described_class.new(model: 'X5', year: '2010', odometer: '250000', price: '12000')
    expect(car).not_to be_valid
  end

  it 'is not valid without a model' do
    car = described_class.new(make: 'BMW', year: '2010', odometer: '250000', price: '12000')
    expect(car).not_to be_valid
  end

  it 'is not valid without a year' do
    car = described_class.new(make: 'BMW', model: 'X5', odometer: '250000', price: '12000')
    expect(car).not_to be_valid
  end

  it 'is not valid without a odometer' do
    car = described_class.new(make: 'BMW', model: 'X5', year: '2010', price: '12000')
    expect(car).not_to be_valid
  end

  it 'is not valid without a price' do
    car = described_class.new(make: 'BMW', model: 'X5', year: '2010', odometer: '250000')
    expect(car).not_to be_valid
  end
end
