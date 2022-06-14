Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'feed', to: 'scores#user_feed'
    get 'users', to: 'users#index'
    get 'users/:id', to: 'users#show'

    resources :users do
     resources :scores, only: :index
    end

    resources :scores, only: %i[create destroy]
  end
end
