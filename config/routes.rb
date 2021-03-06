Hsi::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users

  resources :users, :only => [:show, :index]
  resources :posts
 
  resources :comments do
    get 'new_reply', :on => :member 
    post 'create_reply', :on => :member
    delete 'reply', :on => :member
  end
  
  resources :upvotes
  resources :downvote
end

