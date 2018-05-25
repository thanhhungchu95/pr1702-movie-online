Rails.application.routes.draw do
  root 'static_pages#home'
  get '/search', to: 'static_pages#search'
  get'/new', to: 'static_pages#new'
  devise_for :users
end
