Rails.application.routes.draw do
  root 'palindrome#input'

  get '/signup' => 'users#new'

  post '/users' => 'users#create'
 
  post '/login' => 'session#create'

  get '/login' => 'session#new'

  get '/logout' => 'session#destroy'

  get '/output' => 'palindrome#output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
