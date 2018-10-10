Rails.application.routes.draw do
  root 'dashboards#index'

  resources :dashboards, only: :index

  get 'products/get_data'
  get 'products/add_new_product'
  resources :products

  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
