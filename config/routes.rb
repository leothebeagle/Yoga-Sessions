Rails.application.routes.draw do

  # devise related student routes

  devise_for :students

  devise_scope :student do
    get '/students/login', to: 'devise/sessions#new'
  end

  devise_scope :student do
    get '/students/logout', to: 'devise/sessions#destroy'
  end

  authenticated :student do
    root 'students#show', as: :authenticated_student_root
  end

  

  root 'welcome#home'

  resources :students, only: [:show]
  
  # get 'teachers/homepage' => "welcome#teacher_home"

  # resources :teachers, only: [:show, :new, :create] do
  #   resources :programs, only: [:new, :index, :show, :edit]
  #   resources :videos, only: [:new, :index, :show, :edit]
  # end

  # resources :students, only: [:show, :new, :create] do 
  #   resources :teachers, only: [:index]
  #   resources :programs, only: [:index]
  # end



  
  
    # get '/login' => "sessions#new"
    # post '/login' => "sessions#create"
    # get '/logout' => "sessions#destroy"

    # get '/auth/instagram/callback' => "sessions#create_instagram"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
