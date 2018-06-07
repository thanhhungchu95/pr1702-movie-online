Rails.application.routes.draw do
  root 'static_pages#home'
  get '/search', to: 'static_pages#search'
  get'/new', to: 'static_pages#new'

  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show]
  resources :films do
    get :view, on: :member
    collection do
      get :filter
      get :top_movie

      get :movie, :tv_series

    end
  end
end
