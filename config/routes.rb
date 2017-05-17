Rails.application.routes.draw do
  resources :artists
  resources :songs, only: [:new, :create, :show]
end
