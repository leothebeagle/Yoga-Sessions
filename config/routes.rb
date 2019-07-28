Rails.application.routes.draw do

  root 'welcome#home'
  get 'teachers/homepage' => "welcome#teacher_home"

  resources :teachers, only: [:show, :new, :create]

  resources :students, only: [:show, :new, :create]

  resources :videos, only: [:show, :new, :create]

  resources :programs, only: [:show, :new, :create]

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
