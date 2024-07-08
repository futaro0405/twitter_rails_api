# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controller: {
        registrations: 'api/v1/auth/registrations'
      }
      namespace :auth do
        resources :sessions, only: [:index]
      end

      get 'users/:name', to: 'users#index'
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
