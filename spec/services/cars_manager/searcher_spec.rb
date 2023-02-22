# frozen_string_literal: true

require 'rails_helper'

describe CarsManager::Searcher do
  let(:bmw) { create(:car, :bmw) }
  let(:byd) { create(:car, :byd) }
  let(:audi) { create(:car, :audi) }

  describe '.call' do
    context 'when filters are not specified' do
      let!(:cars) { [bmw, byd, audi] }

      it 'returns all cars' do
        expect(described_class.new(cars: Car.all, params: {}).call).to eq(cars)
      end
    end

    context 'when make filter is specified' do
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
        expect(described_class.new(cars: Car.all, params: params).call).to eq([byd])
      end
    end

    context 'when year to filter is specified' do
      let(:params) do
        { year_to: 2011 }
      end

      it 'returns only cars with year < 2011' do
        expect(described_class.new(cars: Car.all, params: params).call).to eq([bmw])
      end
    end

    context 'when price from filter is specified' do
      let(:params) do
        { price_from: 150_00 }
      end

      it 'returns only cars with price > 15000' do
        expect(described_class.new(cars: Car.all, params: params).call).to eq([audi])
      end
    end

    context 'when price to filter is specified' do
      let(:params) do
        { price_to: 150_00 }
      end

      it 'returns only cars with price < 15000' do
        expect(described_class.new(cars: Car.all, params: params).call).to eq([byd, bmw])
      end
    end

    context 'when params are invalid' do
      let(:params) do
        { make: 'invalid value' }
      end

      it 'returns empty array' do
        expect(described_class.new(cars: Car.all, params: params).call).to eq([])
      end
    end
  end
end
