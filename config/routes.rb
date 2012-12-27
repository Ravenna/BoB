Bob::Application.routes.draw do

  resources :videos
  resources :emails
  
  resources :awards 
  resources :recommendations 
  resources :approvals 
  resources :pages
  resources :accounts, :as => :user
 
  resources :categories do
    resources :awards do
        resources :recommendations 
    end
  end 

  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions"}
  
  match 'home' => 'pages#home', :as => :home
  match 'overview-timeline' => 'pages#overview', :as => :overview
  match 'prizes' => 'pages#prizes', :as => :prizes
  match 'award-categories' => 'pages#awards', :as => :awardcat
  match 'admin' => 'pages#admin', :as => :admin
  match 'accounts-list' => 'pages#users_list', :as => :accounts_list
  match 'location' => 'categories#index', :as => :location
  match 'admin-awards' => 'pages#admin_awards', :as => :admin_awards
  match 'admin-recommendations' => 'pages#admin_recommendations', :as => :admin_recommendations
  match 'export' => 'pages#export', :as => :export_recommendations
  match 'inbox' => 'pages#inbox', :as => :inbox  
  match 'question' => 'pages#question', :as => :question
  match 'thank-you' => 'pages#thankyou', :as => :thankyou
  match 'my-recommendations' => 'pages#recs', :as => :recs
  match 'photos-video' => 'pages#photos_video', :as => :photo_video
  match 'toggle_decline' => 'approvals#toggle_decline'
  match "asset/:id", :to => "assets#destroy_asset", :as=> "destroy_asset"
  match 'question' => "questions#create", :via => :post
  
  root :to => 'pages#home'
end
