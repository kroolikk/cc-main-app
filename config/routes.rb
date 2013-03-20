CcDev1::Application.routes.draw do


  # chwilowe routingi wrzucajmy na początku
  # moje dziadowskie routy 
  match "/single_art" => "home#single_article", :as => :single_art
  match "/user_reg" => "home#user_reg", :as => :user_reg
  match "/user_prof" => "home#user_prof", :as => :user_prof
  match "admin/example_form" => "mtest#example_form", :as => :example_form

  match "/o_nas" => "home#about", :as => :about
  match "/regulamin" => "home#terms", :as => :terms



  mount Ckeditor::Engine => '/ckeditor'

  match "/admin" => "admin#index", :as => :admin
  match "admin/login" => "admin#login", :as => :admin_login
  match "admin/enter" => "admin#enter", :as => :admin_enter
  match "admin/logout" => "admin#logout", :as => :admin_logout

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :path => 'uzytkownicy'
  resources :places
  resources :posts
  resources :preferences

  match "nastepne-posty" => "home#load_more_posts", :as => :load_more_posts
  match "post/:id" => "front_posts#show", :as => :single_post

  match "miejsca" => "front_places#index", :as => :front_places
  match "miejsca/:category" => "front_places#index"
  match "miejsca/:category/strona_:page" => "front_places#index"
  match "pokaz-miejsca" => "front_places#add_places_to_map", :as => :add_places_to_map
  match "miejsce/:id" => "front_places#show", :as => :single_place  

  match "/kalendarz" => "home#calendar", :as => :calendar
  match "/kalendarz/:year/:month/:week" => "home#calendar", :as => :calendar_date
  match "/kontakt" => "home#contact", :as => :contact
  match "/:category" => "home#index", :as => :category


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
  root                    :to => 'home#index'


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
