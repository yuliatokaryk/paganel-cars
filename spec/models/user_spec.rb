# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is invalid without email' do
    user.email = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is invalid with different password and password confirmation' do
    user.password_confirmation = '123456'
    expect(user).not_to be_valid
  end

  it 'sets admin status' do
    user.admin!
    expect(user.status).to eq('admin')
  end

  describe 'associations' do
    it { is_expected.to have_many(:my_searches) }
  end
end
