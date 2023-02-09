# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'is valid with valid attributes' do
    user = described_class.new(email: 'user@gmail.com', password: '123123', password_confirmation: '123123')
    expect(user).to be_valid
  end

  it 'is not valid without email' do
    user = described_class.new(password: '123123', password_confirmation: '123123')
    expect(user).not_to be_valid
  end

  it 'is not valid without password' do
    user = described_class.new(email: 'user@gmail.com')
    expect(user).not_to be_valid
  end

  it 'is not valid with different password and password confirmation' do
    user = described_class.new(email: 'user@gmail.com', password: '111111', password_confirmation: '222222')
    expect(user).not_to be_valid
  end
end
