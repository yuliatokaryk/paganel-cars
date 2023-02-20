# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MySearchController do
  let(:user) { create(:user) }

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
    it "deletes all user's searches" do
      delete :destroy_all
      expect(MySearch.count).to be(0)
    end
  end
end
