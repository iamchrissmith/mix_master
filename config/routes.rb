Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:index, :new, :create, :destroy], module: :artists
  end

  resources :songs, only: [:index, :show, :edit, :update, :destroy]

  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]

  get '/auth/spotify/callback', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
end
