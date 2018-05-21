Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: 'confirmations' }
  root "pages#home"
  resources :items
  get 'users/:id/dashboard', to: 'users#dashboard', as: "user_dashboard"
  get 'users/:id/complete_profile', to: 'users#complete_profile', as: "complete_profile"
  post 'users/:id/save_profile', to: 'users#save_profile', as: "save_profile"

  post 'items/messages/send_message',  to: 'messages#send_message'
  delete 'favourites/:id', to: 'favourites#destroy', as: "favourite_path"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
