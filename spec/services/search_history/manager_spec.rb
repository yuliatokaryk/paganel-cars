# frozen_string_literal: true

require 'rails_helper'

describe SearchHistory::Manager do
  subject(:search_history) { described_class.new(params: params, user: user.id) }

  let(:params) { { make: 'x', model: 'x', year_to: 2010 } }
  let(:user) { create(:user) }

  describe '.call' do
    it 'returns new record to database' do
      expect { search_history.call }.to change(MySearch, :count)
    end
  end
end
