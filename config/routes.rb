Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  get 'sample', to: "static_pages#sample"
  
  resources :items
  resources :users
  
  resources :projects do
    resources :items
  end

end
