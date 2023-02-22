# frozen_string_literal: true

require 'rails_helper'

describe SearchHistory::Manager do
  let(:params) { { make: 'x', model: 'x', year_to: 2010 } }
  let(:user) { create(:user) }

  describe '.call' do
    it 'returns new record to database' do
      expect { described_class.new(params: params, user: user.id).call }.to change(MySearch, :count)
    end
  end
end
