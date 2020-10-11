Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "homes#top"
  resources :posts, shallow: true do
    resources :comments, only:[:create, :destroy] 
    resource :favorites, only:[:create, :destroy]
    get :favorites, on: :collection
  end
  get 'search', to: 'posts#search'
  resources :users, only: :show
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
