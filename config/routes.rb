Rails.application.routes.draw do
  devise_for :users

  resources :comments
  resources :posts

  namespace :admin do
    resources :users, :only => [:destroy]
  end

  root 'home#index'

  get 'members' => 'pages#members'
  get 'rules' => 'pages#rules'

  get 'find_mate' => 'posts#find_mate'
end
