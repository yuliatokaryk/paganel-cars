# frozen_string_literal: true

require 'rails_helper'

describe CarsManager::Searcher do
  subject(:searcher) { described_class.new(cars: Car.all, params: params) }

  let(:params) { {} }
  let(:bmw) { create(:car, :bmw) }
  let(:byd) { create(:car, :byd) }
  let(:audi) { create(:car, :audi) }

  describe '.call' do
    context 'when filters are not specified' do
      it 'returns all cars' do
        expect(searcher.call).to eq(Car.all)
      end
    end

    context 'when make filter is specified' do
      let(:params) { { make: 'BMW' } }

      it 'returns only BMW cars' do
        expect(searcher.call).to eq([bmw])
      end
    end

    context 'when model filter is specified' do
      let(:params) { { model: 'Seal' } }

      it 'returns only Seal cars' do
        expect(searcher.call).to eq([byd])
      end
    end

    context 'when year from filter is specified' do
      let(:params) { { year_from: 2011 } }

      it 'returns only cars with year > 2011' do
        expect(searcher.call).to eq([byd])
      end
    end

    context 'when year to filter is specified' do
      let(:params) { { year_to: 2011 } }

      it 'returns only cars with year < 2011' do
        expect(searcher.call).to eq([bmw])
      end
    end

    context 'when price from filter is specified' do
      let(:params) { { price_from: 150_00 } }

      it 'returns only cars with price > 15000' do
        expect(searcher.call).to eq([audi])
      end
    end

    context 'when price to filter is specified' do
      let(:params) { { price_to: 150_00 } }

      it 'returns only cars with price < 15000' do
        expect(searcher.call).to eq([byd, bmw])
      end
    end

    context 'when params are invalid' do
      let(:params) { { make: 'invalid value' } }

      it 'returns empty array' do
        expect(searcher.call).to eq([])
      end
    end
  end
end
