Rails.application.routes.draw do
#後からonlyで制限かける
#デバイス、会員、管理者
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers

#掲示板用
  post 'posts/create' => 'post#create', as: :post_create
  delete 'posts/:id' => 'post#destroy', as: :post_destroy
  resources :topics
  
#共通
  root 'home#top'
  get 'home/about'
  get "search" => "search#search"
  resources :tourists
  resources :spots  do
    resource :likes, only: [:create, :destroy]
  end
  resources :reviews do
    resource :favorites, only: [:create, :destroy]
  end

#会員
  resources :customers do
    get 'relationships/follows'
    get 'relationships/followers'
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

#管理者
  namespace :admins do
    get 'home' => 'home#top'
    resources :tourists
    resources :spots
    resources :reviews, only: [:destroy]
  end
end
