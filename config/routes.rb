Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'followers' => 'followers#index'
  get 'following' => 'following#index'

  resources :posts do
    resources :comments, only: [:create, :destroy, :index], module: :posts
    resources :likes, only: [:create, :destroy, :index], module: :posts
  end

  post 'follow/:user_id' => 'relationships#create'
  delete 'unfollow/:user_id' => 'relationships#destroy'

  root 'welcomes#index'
end
