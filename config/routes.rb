Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'home#index'
  post 'rsvp' => 'home#create'
  get 'show' => 'home#show'
end
