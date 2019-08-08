Rails.application.routes.draw do

  devise_for :students

  root 'welcome#home'

  
  # get 'teachers/homepage' => "welcome#teacher_home"

  # resources :teachers, only: [:show, :new, :create] do
  #   resources :programs, only: [:new, :index, :show, :edit]
  #   resources :videos, only: [:new, :index, :show, :edit]
  # end

  # resources :students, only: [:show, :new, :create] do 
  #   resources :teachers, only: [:index]
  #   resources :programs, only: [:index]
  # end

  resources :videos, only: [:show, :new, :create, :destroy, :update ]

  resources :programs, only: [:show, :new, :create, :index, :update, :destroy]

  resources :library_items, only: [:create]
  
  
    # get '/login' => "sessions#new"
    # post '/login' => "sessions#create"
    # get '/logout' => "sessions#destroy"

    # get '/auth/instagram/callback' => "sessions#create_instagram"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
