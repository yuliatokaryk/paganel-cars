# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistic do
  it 'is valid with valid attributes' do
    statistic = described_class.new(search_rules: { make: 'x', model: 'x' }, requests_quantity: 1, total_quantity: 0)
    expect(statistic).to be_valid
  end
end
