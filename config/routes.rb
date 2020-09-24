Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  resources :posts, shallow: true do
    resources :comments, only:[:create, :destroy] 
    resource :favorites, only:[:create, :destroy]
    get :favorites, on: :collection
  end
  resources :users, only: :show
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
