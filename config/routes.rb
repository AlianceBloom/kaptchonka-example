Rails.application.routes.draw do
  root to: 'post#new'
  resources :post
end
