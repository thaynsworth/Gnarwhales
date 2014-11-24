Rails.application.routes.draw do


  get 'users/new'


  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'notifications' => 'static_pages#notifications'

  get 'signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  root 'static_pages#home'

  post 'collaborations/create' => 'collaborations#create', as: "new_collaboration"
  get 'collaborations' => 'collaborations#index', as: "collaborations"
  delete'collaborations/destroy/:id' => 'collaborations#destroy', as: "destroy_collaboration"
  patch 'collaborations/update/:id' => 'collaborations#update', as: "collaboration"

  post '/skills/user/:id' => 'skills#user_create'
  post '/skills/project' => 'skills#project_create'

  post 'comments' => 'comments#create', as: "new_comment"
  patch 'comments' => 'comments#update'
  delete 'comments/:id' => 'comments#destroy'

  post 'updates/project' => 'updates#create', as: "new_update"
  patch 'updates/project' => 'updates#update'
  delete 'updates/:id' => 'updates#destroy'



  resources :users
  resources :projects 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
