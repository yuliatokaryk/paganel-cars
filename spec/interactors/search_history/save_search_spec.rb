# frozen_string_literal: true

require 'rails_helper'

describe SearchHistory::SaveSearch do
  let(:params) { { make: 'x', model: 'x', year_to: 2010 } }
  let(:user) { create(:user) }

  describe '.call' do
    subject(:context) { described_class.call(params: params, user: user.id) }

    it 'creates a new search history record with the given params and user_id' do
      expect { context }.to change(MySearch, :count)
    end
  end
end
