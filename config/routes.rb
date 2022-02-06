Rails.application.routes.draw do
  resources :enrollments
  resources :courses
  resources :students
  resources :instructors
  resources :admins
  resources :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
