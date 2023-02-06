Rails.application.routes.draw do
  root 'home#index'

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  resources :cars

  get 'help', to: 'help#index'
end
