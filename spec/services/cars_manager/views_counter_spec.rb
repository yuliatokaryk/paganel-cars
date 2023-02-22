# frozen_string_literal: true

require 'rails_helper'

describe CarsManager::ViewsCounter do
  let(:car) { create(:car) }

  describe '.call' do
    it 'returns car with the number of views will increased by 1' do
      expect { described_class.new(car).call }.to change(car, :views).by(1)
    end
  end
end
