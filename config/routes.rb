Bob::Application.routes.draw do
  

 
  resources :videos

#  resources :questions
  match 'question' => "questions#create", :via => :post

  resources :categories
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
  
  
  match 'location' => 'pages#location', :as => :location
  match 'location/:id' => 'pages#award_cat', :as => :show_location
  match 'location/:category_id/:award_id/recommend' => 'recommendations#new', :as => :recommend_award
  match 'award-cat' => 'categories/:id/awards/#award_cat', :as => :award_cat
  
  match 'question' => 'pages#question', :as => :question
  match 'thank-you' => 'pages#thankyou', :as => :thankyou
  match 'my-recommendations' => 'pages#recs', :as => :recs
  match 'photos-video' => 'pages#photos_video', :as => :photo_video
  
  resources :recommendations, :shallow => true do
    resources :approvals 
  end
  match 'toggle_decline' => 'approvals#toggle_decline'

  resources :awards

  root :to => 'pages#home'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
