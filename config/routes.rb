Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'
  resources :posts, only: [:index,:create]
  resources :users, only: [:show] do
    resources :follows, only: [:create,:destroy]
    get 'user_following' ,to: 'follows#user_following'
    get 'user_followed' ,to: 'follows#user_followed'
  end

end
