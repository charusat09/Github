Rails.application.routes.draw do
  resources :repos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "repos#index"
end
