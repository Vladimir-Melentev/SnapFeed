Rails.application.routes.draw do
  resources :users, only: %i[new create]

  resources :posts do
    resources :comments, except: %i[new show]
  end

  root "homes#index"
end
