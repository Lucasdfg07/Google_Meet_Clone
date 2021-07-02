Rails.application.routes.draw do
  root 'home#index'
  
  resources :rooms
  resources :messages, only: [:create]
  
  get 'search', to: 'rooms#search', as: 'search_rooms'
end
