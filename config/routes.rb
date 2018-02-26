Rails.application.routes.draw do
  get 'users/new'

  resources :histories

   get 'users/my_history'



  get 'users/sign_up', to: "users#new"
  post 'users', to: "users#create"
  resources :sessions, only: [:create, :destroy , :new]
  root "histories#index"

end
