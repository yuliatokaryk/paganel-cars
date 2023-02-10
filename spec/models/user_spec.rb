# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is not valid with different password and password confirmation' do
    user.password_confirmation = '123456'
    expect(user).not_to be_valid
  end

  describe '#create' do
    it 'set user status by default' do
      expect(user.status).to eq('user')
    end
  end

  it 'set admit status' do
    user.admin!
    expect(user.status).to eq('admin')
  end
end
