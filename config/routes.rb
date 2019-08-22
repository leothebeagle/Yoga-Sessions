Rails.application.routes.draw do

  devise_for :teachers, :path => "teachers/account"

  devise_scope :teacher do
    get '/teachers/login', to: 'devise/sessions#new'
  end

  devise_scope :teacher do
    get '/teachers/logout', to: 'devise/sessions#destroy'
  end

  devise_for :student, :path => "students/account", controllers: {omniauth_callbacks: "student/omniauth_callbacks"}

  devise_scope :student do 
    delete 'logout', :to => 'devise/sessions#destroy', :as => :destroy_student_ig_session  
  end

  devise_scope :student do
    get '/students/login', to: 'devise/sessions#new'
  end

  devise_scope :student do
    get '/students/logout', to: 'devise/sessions#destroy'
  end  

#  # Other routes

  root 'welcome#home'
  get 'teachers/homepage' => "welcome#teacher_home"

  resources :programs, only: [:index, :show, :create, :update, :destroy]
 
  resources :videos, only: [:show, :new, :create, :update, :destroy]
  
  resources :library_items, only: [:create]
  delete 'library_items' => 'library_items#destroy'
  resources :favorites, only: [:create, :destroy]
  
  post 'favorites' => 'favorites#create'
  delete 'favorites' => 'favorites#destroy'

  resources :teachers, only: [:show, :new, :create, :index] do
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
