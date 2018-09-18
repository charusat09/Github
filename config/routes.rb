Rails.application.routes.draw do
  resources :repos, only: [:index]
  resources :favorites, only: [:create, :destroy]
  root "repos#index"
end
