Rails.application.routes.draw do
  root "exams#index"

  resources :exams
end
