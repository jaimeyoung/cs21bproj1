Finalprojv3::Application.routes.draw do
  resources :tasks do
  	collection do
  		get 'completed' 
  		post 'complete'
  		get 'search'
  	end
    
  end

root 'pages#hello'

get '/help' => 'pages#help'




end
