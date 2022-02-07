Rails.application.routes.draw do
  resources :enrollments
  resources :courses
  resources :students
  resources :instructors
  resources :admins
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'home/index'
  root 'home#index'
  get 'login', to: "sessions#new", as: 'login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
