Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :arts do
    resources :reviews
  end
  resources :users
  resources :reviews


  get "dashboard",            to: 'pages#dashboard'
  get "paintings",            to: 'pages#paintings'
  get "drawings",             to: 'pages#drawings'
  get "digital_paintings",    to: 'pages#digital_paintings'
  get "photography",          to: 'pages#photography'

  get "my_paintings",         to: 'pages#my_paintings'
  get "my_drawings",          to: 'pages#my_drawings'
  get "my_digits",            to: 'pages#my_digits'
  get "my_photos",            to: 'pages#my_photos'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
