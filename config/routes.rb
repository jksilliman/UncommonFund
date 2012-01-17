Committees::Application.routes.draw do
  resources :committees, :only => [:index, :show]
  resources :nominations, :only => [:new, :create]
  resources :applications, :only => [:new, :create] 
  
  devise_for :users

  #   match 'products/:id' => 'catalog#view'

  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase

  #   resources :products

  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  namespace :admin do
    resources :users, :only => [:index, :new, :create, :destroy]
    resources :sections
    resources :committees
    resources :content, :only => [:index, :edit, :update]
    resources :questions, :only => [:index, :new, :create, :destroy]
    resources :nominations, :only => [:index, :show, :edit, :update, :destroy]
    root :to => 'committees#index', :as => ""
  end



  root :to => 'main#index'

end
