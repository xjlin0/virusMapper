Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users, only: [:index, :show] do
  	resources :followships, only: [:index, :destroy]
  	post '/followships' => 'followships#create', as: 'new_followship'
  	delete '/followships' => 'followships#destroy', as: 'remove_followship'
  end
end
