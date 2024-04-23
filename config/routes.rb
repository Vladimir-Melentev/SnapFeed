# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :likes, only: %i[create destroy]

  resources :users, only: %i[new create edit update show] do
    resource :follows, only: %i[create destroy], controller: 'follows'

    # Вложенный ресурс для просмотра всех постов пользователя
    resources :posts, only: :index
  end

  resources :posts do
    resources :subcomments, only: %i[create destroy]

    resources :comments, except: %i[new show]
  end

  resources :comments, except: %i[new show] do
    resources :subcomments, only: %i[create destroy]
  end

  namespace :admin do
    resources :users, only: %i[index create edit update destroy]
  end

  root 'homes#index'
end
