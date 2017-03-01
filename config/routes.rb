Rails.application.routes.draw do
  post 'dishes/:id/upvote', to: 'votes#upvote', as: :dish_upvote
  post 'dishes/:id/downvote', to: 'votes#downvote', as: :dish_downvote

  get 'cafeterias/:slug', to: 'public_cafeterias#show', as: :public_cafeteria

  get '/admin', to: 'admin#dashboard'

  scope '/admin' do
    resources :cafeterias do
      resources :dishes, only: [:create, :destroy]
      resources :menus, except: [:index, :show] do
        resources :dish_menus, only: [:create, :destroy]
      end
    end
  end

  root to: 'public_cafeterias#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks',
    passwords: 'admins/passwords'
  }
end
