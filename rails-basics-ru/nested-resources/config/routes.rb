# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  # resources :posts, shallow: true do
  #   resources :comments, only: [:new, :create]
  # end
#  resources :posts, shallow: true do
#     resources :comments, only: [:new, :create]
#     scope module: :posts do
#       resources :comments, only: [:edit, :update, :destroy]
#     end
#   end


  # resources :posts, shallow: true do
  #   resources :comments, only: [:create, :new, :destroy]
  # end
  resources :posts

  scope module: :posts do
    resources :posts, except: [:index, :show, :edit, :update, :new, :create, :destroy], shallow: true do
      resources :comments, except: [:index, :show]
    end
  end
  # END
end
