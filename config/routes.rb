# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users,
                 path:        'auth',
                 skip:        [:confirmations, :passwords],
                 sign_in_via: [:put],
                 path_names:  {
                   sign_in:      'login',
                   sign_out:     'logout',
                   registration: 'register'
                 },
                 controllers: {
                   sessions:      'api/v1/users/sessions',
                   registrations: 'api/v1/users/registrations'
                 }
    end
  end
end
