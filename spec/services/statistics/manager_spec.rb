# frozen_string_literal: true

require 'rails_helper'

describe Statistics::Manager do
  describe '.call' do
    context 'when there is no record with the specified parameters yet' do
      let(:params) { { make: 'x', model: 'x', year_to: 2010 } }
      let(:total_quantity) { 3 }

      it 'returns new statistic record to database' do
        expect { described_class.new(total_quantity: total_quantity, params: params).call }.to change(Statistic, :count)
      end
    end

    context 'when there is record with the specified parameters' do
      let(:statistic_record) { create(:statistic) }
      let(:params) { { make: 'x', model: 'x' } }
      let(:total_quantity) { 0 }

      it 'returns increase the requests quantity' do
        expect { described_class.new(total_quantity: total_quantity, params: params).call }.to change(Statistic, :last)
      end
    end
  end
end
