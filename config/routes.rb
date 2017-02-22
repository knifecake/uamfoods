Rails.application.routes.draw do
  get 'cafeterias/:id', to: 'public_cafeterias#show', as: :public_cafeteria

  scope '/admin' do
    resources :cafeterias do
      resources :dishes, only: [:create, :destroy]
      resources :menus, except: [:index, :show] do
        resources :dish_menus, only: [:create, :destroy]
      end
    end
  end

  root to: 'public_cafeterias#index'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks',
    passwords: 'admins/passwords'
  }
end
