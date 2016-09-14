Rails.application.routes.draw do
  devise_for :users
  root controller: :home, action: :index
  get 'private', controller: :home, action: :private
end
