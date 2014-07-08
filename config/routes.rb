Rails.application.routes.draw do
  devise_for :users

  resources :comments do
    member do
      post 'user_score'
    end
  end

  resources :posts

  namespace :admin do
    resources :users, :only => [:destroy]
  end

  root 'home#index'

  get 'members' => 'pages#members'
  get 'rules' => 'pages#rules'
  get 'intro' => 'pages#intro'

  get 'find_mate' => 'posts#find_mate'
end
