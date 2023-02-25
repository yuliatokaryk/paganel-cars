# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Statistic do
  let(:statistic) { create(:statistic) }

  it 'is valid with valid attributes' do
    expect(statistic).to be_valid
  end
end
