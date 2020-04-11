# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users,
  #            path:        'auth',
  #            skip:        [:confirmations, :passwords],
  #            path_names:  {
  #              sign_in:      'login',
  #              sign_out:     'logout',
  #              registration: 'register'
  #            },
  #            controllers: {
  #              sessions:      'api/v1/auth/sessions',
  #              registrations: 'api/v1/auth/registrations'
  #            }
  devise_for :users,
             skip: [:sessions, :confirmations, :passwords, :registrations]

  namespace :api, path: '' do
    namespace :v1, path: '' do
      scope :auth do
        devise_scope :user do
          ## SESSIONS ##
          post    :'login', to: 'auth/sessions#create'
          delete  :'logout', to: 'auth/sessions#destroy'

          ## REGISTRATIONS ##
          post    :'register', to: 'auth/registrations#create'
          delete  :'unregister', to: 'auth/registrations#destroy'
        end
      end
    end
  end
end
