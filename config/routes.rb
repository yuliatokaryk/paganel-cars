Rails.application.routes.draw do
  root 'home#index'

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  resources :cars

  get 'help', to: 'help#index'
  get 'search', to: 'search#index'
  get 'my_search', to: 'my_search#index'
  delete 'destroy/my_search', to: 'my_search#destroy_all'
end
