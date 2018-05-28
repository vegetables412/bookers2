Rails.application.routes.draw do

  devise_for :users
  get '/top' => 'books#top'
  get '/home/about' => 'root#top'
  root 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
