Rails.application.routes.draw do
	
  devise_for :users
  get '/photos/myphotos', to: 'photos#myphotos'

  resources :photos do
    resources :comments

    member do
      	get 'like'
    end

  end
  
  root 'photos#index'

 
    

end
