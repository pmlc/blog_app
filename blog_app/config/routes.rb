Rails.application.routes.draw do

  # You can have the root of your site routed with "root"
  root to: 'articles#index'
  resources :articles
end
