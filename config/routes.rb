Rails.application.routes.draw do
  root "projects#index"
  get 'sample', to: "static_pages#sample"
  
  resources :items
  
  resources :projects do
    resources :items
  end

end
