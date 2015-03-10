Rails.application.routes.draw do
  resources :photos

  devise_for :users
  resources :comments
  resources :blog_posts

  root "blog_posts#map"
  get "allusers" => "blog_posts#showusers"
end
