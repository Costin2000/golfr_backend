Rails.application.routes.draw do
  devise_for :users, skip: :all

  namespace :api do
    post 'login', to: 'users#login'
    get 'feed', to: 'scores#user_feed'
    get 'users/:id', to: 'users#get_name_by_id'
    get 'users/:id/scores', to: 'users#get_scores_by_id'
  end
end
