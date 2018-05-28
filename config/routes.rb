Rails.application.routes.draw do
  root 'static_pages#home'
  get '/search', to: 'static_pages#search'
  get'/new', to: 'static_pages#new'

  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :films do
    collection do
      get :movie, :tv_series
    end
  end
end
