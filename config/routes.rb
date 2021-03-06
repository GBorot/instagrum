Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # dashboard
  get '/dashboard' => 'accounts#index'
  get 'profile/:username' => 'accounts#profile', as: :profile
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post
  # get 'post/like/:post_id' => 'likes#delete_like', as: :unlike_post


  resources :posts, only: [:new, :create, :show] do
    resources :likes, only: :create
    member do
      delete 'unlike', to: 'likes#destroy', as: :unlike
    end
  end

  root to: 'public#homepage'
end
