Rails.application.routes.draw do

  post 'user/create'
  post 'user/login'
  post 'api/v1/vigigluco/create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 
  resources :password_resets, only:[ :create, :update, :new, :edit ]
end
