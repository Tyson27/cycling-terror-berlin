  Rails.application.routes.draw do
  resource :profile
  resources :problems do
   put :favorite, on: :member
  end
  devise_for :users
  root to: 'pages#home'
  get '/profile', to:'pages#profile'
  get '/dashboard', to:'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
