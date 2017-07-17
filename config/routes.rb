Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :membership_applications, only: [:create, :show]
      resources :reservations, only: [:create, :index]
    end
  end

  scope module: 'website' do
    resources :membership_applications, only: [:create, :show]
    resources :reservations, only: [:index]
    resources :planes, only: [:show]
    get '/planes/:id/reservations.json', to: 'planes#reservations'
    get 'hello/index'
    root 'hello#index'
    get 'membership_applications/show'

    get 'varauskalenteri', to: 'reservations#index'
    get 'liity', to: 'membership_applications#join'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
