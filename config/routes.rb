Rails.application.routes.draw do
 

  root 'welcome#home'
  get 'teachers/homepage' => "welcome#teacher_home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
