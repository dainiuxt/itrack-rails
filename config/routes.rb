Rails.application.routes.draw do
  get 'latest_issues/index'
  devise_for :users, path: 'auth'
  
  authenticated(:user) do
    root to: "dashboards#index", as: :authenticated_root
  end
  
  root "static_pages#hello"
  get 'hello', to: "static_pages#hello"

  resources :issues
  resources :users, :controller => 'users'
  
  resources :projects do
    resources :issues
  end

end
