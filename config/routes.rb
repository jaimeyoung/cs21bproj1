Finalprojv3::Application.routes.draw do
  devise_for :users
  devise_scope :user do
        get '/logout' => 'devise/sessions#destroy'
  end
  
  root to: 'tasks#index'
  resources :tasks do
  	collection do
  		get 'completed' 
  		post 'complete'
  		get 'search'
  		
  	end
    
  end

get '/help' => 'pages#help'




end
