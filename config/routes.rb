Rails.application.routes.draw do
  namespace :admin do
    get 'home/welcome'
  end

  root to: 'admin/home#welcome'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks',
    passwords: 'admins/passwords'
  }
end
