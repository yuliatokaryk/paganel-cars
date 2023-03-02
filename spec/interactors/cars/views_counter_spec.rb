# frozen_string_literal: true

require 'rails_helper'

describe Cars::ViewsCounter do
  let(:car) { create(:car) }

  describe '.call' do
    subject(:context) { described_class.call(car: car) }

    it 'increments the views count by 1' do
      expect { context }.to change(car, :views).by(1)
    end
  end
end
