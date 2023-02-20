# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatisticsController do
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }

  describe 'GET index' do
    context 'when user is an admin' do
      it 'renders the index template' do
        sign_in admin

        get :index
        expect(response).to render_template('index')
      end

      it 'has a 200 status code' do
        sign_in admin

        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is not an admin' do
      it 'redirect to the root template' do
        sign_in user

        get :index
        expect(response).to redirect_to('/')
      end

      it 'has a 302 status code' do
        sign_in user

        get :index
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'DELETE destroy_all' do
    let(:statistic) { create(:statistic) }

    it 'clears statistics' do
      delete :destroy_all
      expect(Statistic.count).to be(0)
    end
  end
end
