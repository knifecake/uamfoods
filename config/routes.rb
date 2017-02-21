Rails.application.routes.draw do
  namespace :admin do
      get 'home/welcome'
  end

  scope '/admin' do
    resources :cafeterias do
      resources :dishes, only: [:create, :destroy]
      resources :menus do
        resources :dish_menus, only: [:create, :destroy]
      end
    end
  end

  root to: 'admin/home#welcome'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks',
    passwords: 'admins/passwords'
  }
end
