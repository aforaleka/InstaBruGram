Rails.application.routes.draw do
  devise_for :users
  resources :photos do
    resources :comments
    member do
      get 'like'
    end
  end
  

  root 'photos#index'
end
