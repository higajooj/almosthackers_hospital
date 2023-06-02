Rails.application.routes.draw do
  resources :hospitals
  root "exams#index"

  devise_for :users

  resources :exams
end
