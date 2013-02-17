UncommonFund::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'users/sessions'}


  resources :projects, :only => [:index, :show, :edit, :update] do
    member do
      post :like
      post :unlike
    end
  end

  namespace :admin do
    resources :projects, :only => [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, :only => [:index, :new, :create, :edit, :update, :destroy]
    resources :users, :only => [:index, :new, :create, :destroy]
    resources :content, :only => [:index, :edit, :update]
    root :to => 'users#index', :as => ""
  end

  root :to => 'high_voltage/pages#show', :id => 'home'


end
