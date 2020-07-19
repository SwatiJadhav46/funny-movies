Rails.application.routes.draw do
  devise_for :users

  # devise_scope :users do
  #   get '/users', to: 'devise/registrations#new'
  #   # get '/users/password', to: 'devise/passwords#new'
  # end

  root to: "shared_videos#index"
  get '/dashboard', to: 'shared_videos#index'

  resources :shared_videos, only: [:index, :new, :create] do
  end
end
