Rails.application.routes.draw do
  devise_for :users
  
  authenticated(:user) do
    root to: "projects#index", as: :authenticated_root
  end
  
  root "static_pages#hello"
  get 'hello', to: "static_pages#hello"
  get 'projects/list', to: "projects#list"

  resources :issues
  resources :users
  
  resources :projects do
    resources :issues
  end

end
