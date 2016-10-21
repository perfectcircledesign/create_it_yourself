Rails.application.routes.draw do

  root 'pages#home'
  match "/" => "pages#home", via: [:gets, :post]


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies, :only => [:show]

  resources :divisions, :only => [:index, :new, :create, :show, :destroy, :edit] do

  	member  do 
		  get "generate"
      post "preview"
      get "preview"
      get "completed_job"
  	end  
  end
  get '/robots' => 'pages#robots'
  get '/:id' => 'companies#show'


end
