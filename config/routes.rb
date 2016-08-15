Rails.application.routes.draw do

  resources :attractions
  post "/attractions/:id/ride" => "attractions#ride"

  resources :rides

  resources :users
  
  root "welcome#home"
  
  get "/signin" => "users#signin"
  get "/signout" => "users#signout"
  post "/signin" => "users#begin_new_session"

end