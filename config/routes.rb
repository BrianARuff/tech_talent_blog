Rails.application.routes.draw do
  root "blog_posts#index"

  resources :blog_posts
  resources :comments, only: [:edit, :update, :destroy, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
