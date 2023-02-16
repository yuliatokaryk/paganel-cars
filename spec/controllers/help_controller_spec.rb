# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HelpController do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'has a 200 status code' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
