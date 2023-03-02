Rails.application.routes.draw do
resources :sessions, only: [:create]
 post "create" => "session#create"  
 get "search" => "booking#search" 
 get "generate"=>"booking#generate"
 resources :booking, only:[:index,:create,:show]
 resources :custmer, only:[:create, :show, :index, :update, :destroy]
  resources :hotel, only:[:index, :show, :create, :update, :destroy, :validates]
  resources :accodamation, only:[:index, :create, :update, :destroy] 
  get "hotel/:id/accodamation" => "accodamation#show"
  get "room" => "accodamation#room"
  get "list" => "accodamation#list"
  get "like" => "hotel#like"
  
end
