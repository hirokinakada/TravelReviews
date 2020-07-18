Rails.application.routes.draw do
#後からonlyで制限かける
#デバイス、会員、管理者
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers

#掲示板用
  get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  post 'posts/create' => 'post#create', as: :post_create

#共通
  root 'home#top'
  get 'home/about'
  resources :tourists
  resources :spots
  get "search" => "search#search"
  resources :reviews

#会員
resources :customers

#管理者
  namespace :admins do
    get 'home' => 'home#top'
    resources :tourists
    resources :spots
  end
end
