# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :blogs
  get 'begin' => 'posts#begin'
  get 'daycare' => 'posts#daycare'
  get 'healthcarefacility' => 'posts#healthcarefacility'
  get 'ward' => 'posts#ward'
  get 'outpatient' => 'posts#outpatient'

  root to: 'posts#begin'
  resources :posts do
    resource :favorites, only: %i[create destroy]
    resources :posts, only: [:index]
    resources :comments, only: [:create]
  end

  resources :tweets
  post '/tweets/:id/done' => 'tweets#done', as: 'done'
  # get 'tasks' => 'tasks#index'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
