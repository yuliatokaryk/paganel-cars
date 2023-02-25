# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MySearchController do
  let(:user) { create(:user) }

  describe 'GET index' do
    context 'when there is user' do
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

    context 'when there is no user' do
      it 'redirects to sign_in page' do
        get :index
        expect(response).to redirect_to('/users/sign_in')
      end

      it 'has a 302 status code' do
        get :index
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'DELETE destroy_all' do
    let(:my_search) { create(:my_search, user: user) }

    it "deletes all user's searches" do
      sign_in user

      delete :destroy_all
      expect(MySearch.where(user: user).count).to be(0)
    end
  end
end
