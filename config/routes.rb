Assignment::Application.routes.draw do

  get "cart/index"

  get "product/show"

  get "yahootest/index"

  root to: "home#home"
  #esources :users, only: [:create]
  get "register", to: "user#register"
  post "register", to: "user#create"
  get "login", to: "user#login"
  post "login", to: "user#login_check"
  get "logout", to: "user#logout"
  get "profile", to: "user#profile"
  get "usercp", to: "user#usercp"
  put "usercp", to: "user#update"

  get "yahootest", to:"yahootest#index"

  get "category", to: "home#home"
  get "category/:categoryid", to: "category#show"
  get "category/:categoryid/:page", to: "category#show"

  get "product/add", to: "product#add"
  post "product/add", to: "product#create"
  get "product/:productid", to: "product#show"

  get "user-products", to: "category#user_products"
  get "user-products/:page", to: "category#user_products"

  get "cart", to: "cart#index"
  get "cart/add/:productid/:quantity", to: "cart#create"
  get "cart/edit/:productid/:quantity", to: "cart#edit"
  get "cart/delete/:productid", to: "cart#delete"
  get "cart/empty", to: "cart#empty"
  get "cart/purchase", to: "cart#purchase"
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
  # match ':controller(/:action(/:id))(.:format)'
end
