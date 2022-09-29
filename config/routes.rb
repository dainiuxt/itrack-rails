Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  get 'hello', to: "static_pages#hello"
  
  resources :items
  resources :users
  
  resources :projects do
    resources :items
  end

end
