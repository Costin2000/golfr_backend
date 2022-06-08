Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'feed', to: 'scores#user_feed'
    get 'users/:id', to: 'users#find_name_by_id'
    get 'users/:id/scores', to: 'users#find_scores_by_id'
    resources :scores, only: %i[create destroy]
  end
end
