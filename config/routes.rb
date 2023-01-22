Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :arts
  resources :users

  get "dashboard",            to: 'pages#dashboard'
  get "paintings",            to: 'pages#paintings'
  get "drawings",             to: 'pages#drawings'
  get "digital_paintings",    to: 'pages#digital_paintings'
  get "photography",          to: 'pages#photography'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
