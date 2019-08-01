Rails.application.routes.draw do

  root 'welcome#home'
  get 'teachers/homepage' => "welcome#teacher_home"

  resources :teachers, only: [:show, :new, :create] do
    resources :programs, only: [:new, :index, :show]
    resources :videos, only: [:new, :index, :show]
  end

  resources :students, only: [:show, :new, :create] do 
    resources :teachers, only: [:index]
  end

  resources :videos, only: [:show, :new, :create]

  resources :programs, only: [:show, :new, :create, :index]

  resources :library_items, only: [:create]
  
  
    get '/login' => "sessions#new"
    post '/login' => "sessions#create"
    get '/logout' => "sessions#destroy"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
