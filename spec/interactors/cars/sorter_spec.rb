# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cars::Sorter do
  let(:sort_by) { 'created_at' }
  let(:sort_direction) { 'asc' }
  let(:cars) { create_list(:car, 3) }

  describe '.call' do
    subject(:context) { described_class.call(cars: Car.all, sort_by: sort_by, sort_direction: sort_direction) }

    context 'when order by date ascending' do
      it 'sorts the cars by date ascending' do
        expect(context.cars).to eq(cars.sort_by(&:created_at))
      end
    end

    context 'when order by date descending' do
      let(:sort_direction) { 'desc' }

      it 'sorts the cars by date descending' do
        expect(context.cars).to eq(cars.sort_by(&:created_at).reverse)
      end
    end

    context 'when order by price ascending' do
      let(:sort_by) { 'price' }

      it 'sorts the cars by price ascending' do
        expect(context.cars).to eq(cars.sort_by(&:price))
      end
    end

    context 'when order by price descending' do
      let(:sort_by) { 'price' }
      let(:sort_direction) { 'desc' }

      it 'sorts the cars by price descending' do
        expect(context.cars).to eq(cars.sort_by(&:price).reverse)
      end
    end
  end
end
