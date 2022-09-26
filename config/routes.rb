Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users, only: [:index, :show]
  
  resources :posts do  
    resources :comments, only: [:create]  
  end
  
  

  root to: 'posts#index'
  resources :blogs

  get 'daycare' => 'posts#daycare'
  get 'healthcarefacility' => 'posts#healthcarefacility'
  get 'ward' => 'posts#ward'
  get 'outpatient' => 'posts#outpatient'

  resources :posts do
    resource :favorites, only: [ :create, :destroy]
    collection do
      get 'search'
    end
    resources :comments, only: [:create]  
  end

end
