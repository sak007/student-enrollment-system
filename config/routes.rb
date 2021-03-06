Rails.application.routes.draw do
  resources :enrollments, except: [:edit, :update]
  resources :courses
  resources :students
  resources :instructors
  resources :admins, only: [:update, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]
  get 'home/index'
  root 'home#index'
  
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
