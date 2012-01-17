UncommonFund::Application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users, :only => [:index, :new, :create, :destroy]
    root :to => 'users#index', :as => ""
  end

  root :to => 'main#index'

end
