Rails.application.routes.draw do
  resources :hospitals
  root "hospitals#index"

  devise_for :users

  resources :exams
end
