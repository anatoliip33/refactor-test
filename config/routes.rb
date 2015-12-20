Rails.application.routes.draw do
  devise_for :users
  resources :stories do
    post :translate, on: :member
  end

  resources :ratings

  resources :users do
    resources :stories
  end
  resources :categories do
    resources :stories
  end
  root 'stories#index'
end
