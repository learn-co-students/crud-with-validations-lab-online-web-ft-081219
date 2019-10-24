Rails.application.routes.draw do
  resources :songs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs, only: [:show, :new, :create, :edit, :update, :destroy]

  root 'songs#index'
end
