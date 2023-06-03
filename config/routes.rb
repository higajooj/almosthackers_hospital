Rails.application.routes.draw do
  devise_for :users

  resources :hospitals
  resources :exams

  root "hospitals#index"
end
