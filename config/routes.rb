Rails.application.routes.draw do
  get 'registration/index'
  resources :users
  get 'profile/index'
end
