Rails.application.routes.draw do
  root 'home#index'
  
  resources :rooms
end
