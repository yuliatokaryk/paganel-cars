# frozen_string_literal: true

require 'rails_helper'

describe Cars::Searcher do
  let(:params) { {} }
  let(:bmw) { create(:car, :bmw) }
  let(:byd) { create(:car, :byd) }
  let(:audi) { create(:car, :audi) }

  describe '.call' do
    subject(:context) { described_class.call(params: params, cars: Car.all) }

    context 'when filters are not specified' do
      it 'returns all cars' do
        expect(context.cars).to eq(Car.all)
      end
    end

    context 'when searching by make' do
      let(:params) { { make: 'BMW' } }

      it 'returns only the cars of the specified make' do
        expect(context.cars).to eq([bmw])
      end
    end

    context 'when searching by model' do
      let(:params) { { model: 'Seal' } }

      it 'returns only the cars of the specified model' do
        expect(context.cars).to eq([byd])
      end
    end

    context 'when searching by year from' do
      let(:params) { { year_from: 2011 } }

      it 'returns only the cars within the specified year from range' do
        expect(context.cars).to eq([byd])
      end
    end

    context 'when searching by year to' do
      let(:params) { { year_to: 2011 } }

      it 'returns only the cars within the specified year to range' do
        expect(context.cars).to eq([bmw])
      end
    end

    context 'when searching by price from' do
      let(:params) { { price_from: 150_00 } }

      it 'returns only the cars within the specified price from range' do
        expect(context.cars).to eq([audi])
      end
    end

    context 'when searching by price to' do
      let(:params) { { price_to: 150_00 } }

      it 'returns only the cars within the specified price to range' do
        expect(context.cars).to eq([byd, bmw])
      end
    end

    context 'when searching with multiple criteria' do
      let(:params) { { make: 'BYD', year_to: 2013 } }

      it 'returns only the cars that match all criteria' do
        expect(context.cars).to eq([byd])
      end
    end

    context 'when params are invalid' do
      let(:params) { { make: 'invalid value' } }

      it 'returns empty array' do
        expect(context.cars).to eq([])
      end
    end
  end
end
