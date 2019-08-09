Rails.application.routes.draw do

  devise_for :teachers, :path => "teachers/account"
  # devise related student routes

  devise_scope :teacher do
    get '/teachers/login', to: 'devise/sessions#new'
  end

  devise_scope :teacher do
    get '/teachers/logout', to: 'devise/sessions#destroy'
  end


  devise_for :students, :path => "students/account"

  devise_scope :student do
    get '/students/login', to: 'devise/sessions#new'
  end

  devise_scope :student do
    get '/students/logout', to: 'devise/sessions#destroy'
  end

  authenticated :student do
    root 'students#show', as: :authenticated_student_root
  end

  authenticated :teacher do
    root 'teachers#show', as: :authenticated_teacher_root
  end

#  # Other routes

  root 'welcome#home'
  get 'teachers/homepage' => "welcome#teacher_home"

  resources :programs, only: [:index, :show, :create, :update, :destroy]
  # resources :students, only: [:show]
  resources :videos, only: [:show, :new, :create, :update, :destroy]
  resources :library_items, only: [:create]
  
  

  resources :teachers, only: [:show, :new, :create] do
    resources :programs, only: [:new, :index, :show, :edit]
    resources :videos, only: [:new, :index, :show, :edit]
  end

  resources :students, only: [:show] do 
    resources :teachers, only: [:index]
    resources :programs, only: [:index]
  end



  
  
    # get '/login' => "sessions#new"
    # post '/login' => "sessions#create"
    # get '/logout' => "sessions#destroy"

    # get '/auth/instagram/callback' => "sessions#create_instagram"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
