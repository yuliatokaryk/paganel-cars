# frozen_string_literal: true

require 'rails_helper'

describe CarsManager::Sorter do
  subject(:sorter) { described_class.new(Car.all, order_by, order_direction) }

  let(:order_by) { 'created_at' }
  let(:order_direction) { 'asc' }
  let(:bmw) { create(:car, :bmw) }
  let(:byd) { create(:car, :byd) }
  let(:audi) { create(:car, :audi) }

  describe '.call' do
    context 'when order by date asc' do
      it 'returns cars ordered by date added asc' do
        expect(sorter.call).to eq([bmw, byd, audi])
      end
    end

    context 'when order by date desc' do
      let(:order_direction) { 'desc' }

      it 'returns cars ordered by date added desc' do
        expect(sorter.call).to eq([audi, byd, bmw])
      end
    end

    context 'when order by price asc' do
      let(:order_by) { 'price' }

      it 'returns cars ordered by price asc' do
        expect(sorter.call).to eq([bmw, byd, audi])
      end
    end

    context 'when order by price desc' do
      let(:order_by) { 'price' }
      let(:order_direction) { 'desc' }

      it 'returns cars ordered by price desc' do
        expect(sorter.call).to eq([audi, byd, bmw])
      end
    end
  end
end
