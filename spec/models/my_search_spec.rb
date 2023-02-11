# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MySearch do
  let(:my_search) { create(:my_search) }

  it 'is valid with valid attributes' do
    expect(my_search).to be_valid
  end

  it 'is not valid without user' do
    my_search.user_id = nil
    expect(my_search).not_to be_valid
  end
end
