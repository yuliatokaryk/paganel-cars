# frozen_string_literal: true

require 'rails_helper'

describe CarsManager::Searcher do
  let(:bmw) { Car.create!(make: 'BMW', model: 'X5', year: 2001, odometer: 150_000, price: 120_00) }
  let(:audi) { Car.create!(make: 'Audi', model: 'A4', year: 2010, odometer: 120_000, price: 200_00) }
  let(:byd) { Car.create!(make: 'BYD', model: 'Seal', year: 2021, odometer: 10, price: 200_00) }
  let(:renault) { Car.create!(make: 'Renault', model: 'Aaa', year: 2012, odometer: 250_000, price: 900_0) }

  context 'when filters are not specified' do
    let!(:cars) { [bmw, audi, byd, renault] }

    it 'returns all cars' do
      expect(described_class.new(cars: Car.all, params: {}).call).to eq(cars)
    end
  end

  context 'when some filter is specified' do
    let(:params) do
      { make: 'BMW' }
    end

    it 'returns only BMW cars' do
      expect(described_class.new(cars: Car.all, params: params).call).to eq([bmw])
    end
  end

  context 'when model filter is specified' do
    let(:params) do
      { model: 'Seal' }
    end

    it 'returns only Seal cars' do
      expect(described_class.new(cars: Car.all, params: params).call).to eq([byd])
    end
  end

  context 'when year from filter is specified' do
    let(:params) do
      { year_from: 2011 }
    end

    it 'returns only cars with year > 2011' do
      expect(described_class.new(cars: Car.all, params: params).call).to eq([byd, renault])
    end
  end

  context 'when year to filter is specified' do
    let(:params) do
      { year_to: 2011 }
    end

    it 'returns only cars with year < 2011' do
      expect(described_class.new(cars: Car.all, params: params).call).to eq([bmw, audi])
    end
  end

  context 'when price from filter is specified' do
    let(:params) do
      { price_from: 150_00 }
    end

    it 'returns only cars with price > 15000' do
      expect(described_class.new(cars: Car.all, params: params).call).to eq([audi, byd])
    end
  end

  context 'when price to filter is specified' do
    let(:params) do
      { price_to: 150_00 }
    end

    it 'returns only cars with price < 15000' do
      expect(described_class.new(cars: Car.all, params: params).call).to eq([bmw, renault])
    end
  end
end
