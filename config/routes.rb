Finalprojv3::Application.routes.draw do
  resources :tasks

root 'pages#hello'

get '/help' => 'pages#help'
post '/help' => 'pages#help'

get 'tasks/complete' => 'tasks#complete' 
post 'tasks/complete' => 'tasks#complete'

end
