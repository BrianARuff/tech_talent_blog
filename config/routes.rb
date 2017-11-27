Rails.application.routes.draw do
  root "blog_posts#index"

  resources :blog_posts
  resources :comments
  
  get 'comments/edit'
  get 'models/edit'
  get 'new' => 'blog_posts#new'
  get 'index' => 'blog_posts#index'
  post 'index' => 'blog_posts#index'
  get 'home' => 'blog_posts#index'
  post 'home' => 'blog_posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
