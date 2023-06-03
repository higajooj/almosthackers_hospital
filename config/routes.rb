Rails.application.routes.draw do
  devise_for :users

  resources :hospitals do
    resources :exams, except: %i[index destroy]
  end

  root "hospitals#index"
end
