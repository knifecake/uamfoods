Rails.application.routes.draw do
  namespace :admin do
      get 'home/welcome'
  end

  scope '/admin' do
    resources :cafeterias do
      resources :dishes, only: [:create, :destroy]
      resources :menus do
        member do
          post 'link_dish', action: :link_dish
          delete 'unlink_dish/:dish_id', action: :unlink_dish
        end
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
