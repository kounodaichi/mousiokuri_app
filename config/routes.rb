Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users, only: [:index, :show]
  # resources :posts, only: [:index, :show, :create]

  resources :posts do  
    resources :comments, only: [:create]  
  end
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  
  resources :posts

  root to: 'posts#index'
  resources :blogs

  get 'daycare' => 'posts#daycare'
  get 'healthcarefacility' => 'posts#healthcarefacility'
  get 'ward' => 'posts#ward'
  get 'outpatient' => 'posts#outpatient'

  resources :posts do
    resource :favorites, only: [ :create, :destroy]
  end

  Rails.application.routes.draw do
    resources :posts, only: :index
  end
end
