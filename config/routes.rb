Rails.application.routes.draw do
  devise_for :users

  resources :blogs
  get 'begin' => 'posts#begin'
  get 'daycare' => 'posts#daycare'
  get 'healthcarefacility' => 'posts#healthcarefacility'
  get 'ward' => 'posts#ward'
  get 'outpatient' => 'posts#outpatient'

  root to: 'posts#index'
  resources :posts do
    resource :favorites, only: [ :create, :destroy]
    resources :posts, only: [:index]
    resources :comments, only: [:create]  
  end
 
  resources :tasks
  post '/tasks/:id/done' => 'tasks#done',   as: 'done'
  get 'tasks' => 'tasks#index'
  

  
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
