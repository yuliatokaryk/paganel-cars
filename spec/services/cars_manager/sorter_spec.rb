# frozen_string_literal: true

require 'rails_helper'

describe CarsManager::Sorter do
  let(:bmw) { create(:car, :bmw) }
  let(:byd) { create(:car, :byd) }
  let(:audi) { create(:car, :audi) }

  describe '.call' do
    it 'returns cars ordered by date added desc' do
      expect(described_class.new(Car.all, 'created_at', 'desc').call).to eq([audi, byd, bmw])
    end

    it 'returns cars ordered by date added asc' do
      expect(described_class.new(Car.all, 'created_at', 'asc').call).to eq([bmw, byd, audi])
    end

    it 'returns cars ordered by price desc' do
      expect(described_class.new(Car.all, 'price', 'desc').call).to eq([audi, byd, bmw])
    end

    it 'returns cars ordered by price asc' do
      expect(described_class.new(Car.all, 'price', 'asc').call).to eq([bmw, byd, audi])
    end
  end
end
