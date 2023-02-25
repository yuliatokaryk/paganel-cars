# frozen_string_literal: true

require 'rails_helper'

describe CarsManager::ViewsCounter do
  subject(:views_counter) { described_class.new(car) }

  let(:car) { create(:car) }

  describe '.call' do
    it 'returns car with the number of views will increased by 1' do
      expect { views_counter.call }.to change(car, :views).by(1)
    end
  end
end
