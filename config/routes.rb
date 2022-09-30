Rails.application.routes.draw do
  devise_for :users
  
  authenticated(:user) do
    root to: "projects#index", as: :authenticated_root
  end
  root "static_pages#hello"
  get 'hello', to: "static_pages#hello"

  resources :items
  resources :users
  
  resources :projects do
    resources :items
  end

end
