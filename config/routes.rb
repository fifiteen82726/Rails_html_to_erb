Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post '/home/transform', to: 'home#transform'
  post '/home/form' , to: 'home#form'
  
 
end
