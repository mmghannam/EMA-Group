Rails.application.routes.draw do

    root 'client#default', :as => :root

    get 'client/login', :as => :client_login
    get 'client/sign_up', :as => :client_signup
    get 'client/checkout', :as => :client_checkout
    get 'client/products', :as => :client_products
    get 'client/single_product', :as => :client_single_product
    get 'client/default', :as => :client_dashboard
    get 'admin/dashboard', :as => :admin_dashboard
    get 'contact_us' => 'static_pages#contact_us', :as => :contact_us

    post 'client/make_order' => 'client#make_order'

    scope '/admin' do
        resources :categories
        resources :products
        resources :carts, only: [:index, :show]
        resources :orders, only: [:index, :show]
        resources :offers
        resources :users, only: [:index, :show]
    end

    devise_for :users
    resources :users
    # resources :categories
    # resources :products
    # resources :carts
    # resources :orders
    # resources :offers

    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    # root 'welcome#index'

    # Example of regular route:
    #   get 'products/:id' => 'catalog#view'

    # Example of named route that can be invoked with purchase_url(id: product.id)
    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

    # Example resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Example resource route with options:
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

    # Example resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Example resource route with more complex sub-resources:
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', on: :collection
    #     end
    #   end

    # Example resource route with concerns:
    #   concern :toggleable do
    #     post 'toggle'
    #   end
    #   resources :posts, concerns: :toggleable
    #   resources :photos, concerns: :toggleable

    # Example resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end

end
