Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers

  root 'home#top'
  get 'home/about'
  namespace :admins do
    get 'home' => 'home#top'
  end
end
