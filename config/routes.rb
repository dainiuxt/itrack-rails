Rails.application.routes.draw do
  root "projects#index"
  
  resources :items

  resources :projects do
    resources :items
  end
end
