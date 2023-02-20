# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatisticsController do
  let(:user) { create(:user, :admin) }

  describe 'GET index' do
    it 'renders the index template' do
      sign_in user

      get :index
      expect(response).to render_template('index')
    end

    it 'has a 200 status code' do
      sign_in user

      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE destroy_all' do
    it 'clears statistics' do
      delete :destroy_all
      expect(Statistic.count).to be(0)
    end
  end
end
