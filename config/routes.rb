Bob::Application.routes.draw do
  

 
  resources :videos

#  resources :questions
  match 'question' => "questions#create", :via => :post

  resources :categories do
    resources :awards do
        resources :recommendations 
    end
  end 
  
  
  resources :accounts, :as => :user
  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :pages
  match 'home' => 'pages#home', :as => :home
  match 'overview-timeline' => 'pages#overview', :as => :overview
  match 'prizes' => 'pages#prizes', :as => :prizes
  match 'award-categories' => 'pages#awards', :as => :awardcat
  match 'admin' => 'pages#admin', :as => :admin
  match 'accounts-list' => 'pages#users_list', :as => :accounts_list
  match 'inbox' => 'pages#inbox', :as => :inbox
  
  
  match 'location' => 'categories#index', :as => :location
  match 'location/:id' => 'pages#award_cat', :as => :show_location
  match 'location/:category_id/:award_id/recommend' => 'recommendations#new', :as => :recommend_award
  match 'award-cat' => 'categories/:id/awards/#award_cat', :as => :award_cat
  
  match 'question' => 'pages#question', :as => :question
  match 'thank-you' => 'pages#thankyou', :as => :thankyou
  match 'my-recommendations' => 'pages#recs', :as => :recs
  match 'photos-video' => 'pages#photos_video', :as => :photo_video
  
  #resources :recommendations, :shallow => true do
  resources :approvals 
  #end
  match 'toggle_decline' => 'approvals#toggle_decline'
  
  root :to => 'pages#home'
end
