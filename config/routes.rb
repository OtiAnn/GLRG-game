Rails.application.routes.draw do
  devise_for :users

  resources :comments, :only => [:new, :create, :user_score] do
    member do
      post 'user_score'
    end
  end

  resources :posts

  root 'home#index'

  get 'members' => 'pages#members'
  get 'rules' => 'pages#rules'
  get 'intro' => 'pages#intro'

  get 'find_mate' => 'posts#find_mate'
end
