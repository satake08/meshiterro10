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
#resources :post_images, only: [:new, :create, :index, :show, :destroy]
  #resources :users, only: [:show, :edit]#14章 updateを追加16章
#devise_for :users
#resources :users, only: [:show, :edit, :update]
 #「devise_for :users」を「resources :users, only: [:show, :edit, :update]」の上に移動
#get 'homes/top' =>"homes#top"
#get "homes/about" =>"homes#about", as: 'about'
#root to: "homes#top"
  
  #上記全てを並び替え18章
  devise_for :users
  root to: "homes#top"
  get "homes/about" =>"homes#about", as: 'about'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do#の親内に 18章
    resource :favorites, only: [:create, :destroy]#19章
    #resources :post_comments, only: [:create]#を入れる 18章
    resources :post_comments, only: [:create, :destroy]#18章 :destroy追加
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
