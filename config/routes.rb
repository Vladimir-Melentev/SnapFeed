Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: %i[create destroy edit]
  end

  root "homes#index"
end
