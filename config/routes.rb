Rails.application.routes.draw do
  #get 'users/show'
  #get 'users/edit' まとめて以下でよし
  #resources :users, only: [:show, :edit]12行目に移動
  #上記14章
  #get 'post_images/new'
  #get 'post_images/index'
  #get 'post_images/show' まとめて以下でよし
  #resources :post_images, only: [:new, :index, :show] :create追加
  #resources :post_images, only: [:new, :create, :index, :show] :destroy追加
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit]#14章
  devise_for :users
  get 'homes/top' =>"homes#top"
  get "homes/about" =>"homes#about", as: 'about'
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
