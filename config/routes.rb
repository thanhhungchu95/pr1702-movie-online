Rails.application.routes.draw do
  root 'static_pages#home'
  get'/new', to: 'static_pages#new'
  devise_for :users
end
