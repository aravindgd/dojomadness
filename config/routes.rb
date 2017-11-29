Rails.application.routes.draw do
  resources :abilities
  resources :heroes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope path: '/api' do
    resources :docs, only: [:index], path: '/swagger'

    scope path: '/v1' do
      resources :abilities
      resources :heroes
      # your routes go here
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
