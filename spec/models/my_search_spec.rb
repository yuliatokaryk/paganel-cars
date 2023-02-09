# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MySearch do
  it 'is valid with valid attributes' do
    user = User.create(email: 'user@gmail.com', password: '123123', password_confirmation: '123123')
    my_search = described_class.new(search_rules: { make: 'BMW', year_to: '2010' }, user_id: user.id)
    expect(my_search).to be_valid
  end

  it 'is not valid without user' do
    my_search = described_class.new(search_rules: { make: 'BMW', year_to: '2010' }, user_id: nil)
    expect(my_search).not_to be_valid
  end
end
