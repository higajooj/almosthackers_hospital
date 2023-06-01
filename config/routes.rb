Rails.application.routes.draw do
  root "exams#index"

  devise_for :users

  resources :exams
end
