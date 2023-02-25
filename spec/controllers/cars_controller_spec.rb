# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController do
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }
  let!(:car) { create(:car) }
  let(:valid_attributes) do
    { 'make' => 'New make',
      'model' => 'New model',
      'year' => 2010,
      'odometer' => 120_000,
      'price' => 100_00 }
  end
  let(:invalid_attributes) do
    { 'make' => Faker::Alphanumeric.alpha(number: 51),
      'model' => 'New model',
      'year' => 2025,
      'odometer' => 120_000,
      'price' => -5 }
  end

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

  describe 'GET show' do
    it 'renders the show template' do
      get :show, params: { id: car.id }
      expect(response).to render_template('show')
    end

    it 'has a 200 status code' do
      get :show, params: { id: car.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET new' do
    context 'when the user is an admin' do
      it 'renders the show template' do
        sign_in admin

        get :new
        expect(response).to render_template('new')
      end

      it 'has a 200 status code' do
        sign_in admin

        get :new
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not an admin' do
      it 'redirects the root template' do
        sign_in user

        get :new
        expect(response).to redirect_to('/')
      end

      it 'has a 302 status code' do
        sign_in user

        get :new
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'GET edit' do
    context 'when the user is an admin' do
      it 'renders the edit template' do
        sign_in admin

        get :edit, params: { id: car.id }
        expect(response).to render_template('edit')
      end

      it 'has a 200 status code' do
        sign_in admin

        get :edit, params: { id: car.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not an admin' do
      it 'redirects the root template' do
        sign_in user

        get :edit, params: { id: car.id }
        expect(response).to redirect_to('/')
      end

      it 'has a 302 status code' do
        sign_in user

        get :edit, params: { id: car.id }
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'POST create' do
    context 'with valid data' do
      it 'creates the car' do
        sign_in admin

        expect { post :create, params: { car: valid_attributes } }.to change(Car, :count).by(1)
      end

      it 'redirects to the cars index template' do
        sign_in admin

        delete :destroy, params: { id: car.id }
        expect(response).to redirect_to('/cars')
      end
    end

    context 'with invalid data' do
      it 'does not create the car' do
        sign_in admin

        expect { post :create, params: { car: invalid_attributes } }.not_to change(Car, :count)
      end
    end

    context 'when the use is not admin' do
      it 'does not create the car' do
        sign_in user

        expect { post :create, params: { car: valid_attributes } }.not_to change(Car, :count)
      end
    end
  end

  describe 'PATCH update' do
    context 'with valid data' do
      it 'updates the car' do
        sign_in admin

        patch :update, params: { id: car.id, car: valid_attributes }
        car.reload
        expect(car.make).to eq 'New make'
      end

      it 'redirects to the cars index template' do
        sign_in admin

        delete :destroy, params: { id: car.id }
        expect(response).to redirect_to('/cars')
      end
    end

    context 'with invalid data' do
      it 'does not update the car' do
        sign_in admin

        patch :update, params: { id: car.id, car: invalid_attributes }
        car.reload
        expect(car.model).not_to eq 'New model'
      end
    end

    context 'when the user is not an admin' do
      it 'does not update the car' do
        sign_in user

        patch :update, params: { id: car.id, car: valid_attributes }
        car.reload
        expect(car.model).not_to eq 'New model'
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when the user is an admin' do
      it 'deletes the car' do
        sign_in admin
        expect { delete :destroy, params: { id: car.id } }.to change(Car, :count).by(-1)
      end

      it 'redirects to the cars index template' do
        sign_in admin
        delete :destroy, params: { id: car.id }
        expect(response).to redirect_to('/cars')
      end
    end

    context 'when the user is not an admin' do
      it 'does not delete the car' do
        sign_in user
        expect { delete :destroy, params: { id: car.id } }.not_to change(Car, :count)
      end
    end
  end
end
