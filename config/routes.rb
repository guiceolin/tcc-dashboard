Dashboard::Application.routes.draw do
  get "users" => 'users#index'

  get 'desktop/' => 'home#desktop'

  get 'messages/search' => 'messages#search'
  devise_for :users
  resources :keys, :only => [:index,:new, :create, :destroy]
  resources :messages do
    member do
      put 'unread'
      put 'read'
      put 'archive'
      put 'unarchive'
    end
  end
  resources :master_projects do
    get 'finish', :on => :member
  end
  resources :projects do

    get 'tree', :on => :member
    get "tree/:commit_id" => "projects#tree", :on => :member
    get "tree/:commit_id/:path" => "projects#tree",
      :on => :member,
      :as => :tree_file,
      :constraints => {
      :id => /[a-zA-Z0-9_\-]+/,
      :commit_id => /[a-zA-Z0-9]+/,
      :path => /.*/
    }


    get 'users', :on => :member
    get 'set_active', :on => :member
    get 'finish', :on => :member
    resources :memberships
    resources :documents
    resources :tasks do
      member do
        put 'complete'
        put 'start'
      end
    end
  end

  resources :versions
  #resources :roles
  get 'roles/:id' => 'roles#edit', :as => :edit_role
  put 'roles/:id' => 'roles#update', :as => :edit_role

  authenticate :user do
    root :to => 'home#desktop'
  end
  root :to => 'home#home'
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
