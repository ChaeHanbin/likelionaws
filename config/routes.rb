Rails.application.routes.draw do
  
  devise_for :users
  root 'post#index'
  
  get 'reply/create'
  post 'reply/create'

  get 'reply/destroy'
  get 'reply/destroy/:id' => 'reply#destroy'
  
  get 'post/index'

  get 'post/new'

  get 'post/create'
  post 'post/create' # 정보를 암호화해서 보내는데 rails가 token으로 막아놓았음
  # post 'post/create' => 'post#create'

  get 'post/update'
  post 'post/update/:id' => 'post#update'

  get 'post/edit'
  get 'post/edit/:id' => 'post#edit'

  get 'post/destroy'
  get 'post/destroy/:id' => 'post#destroy'

  get 'post/show'
  get 'post/show/:id' => 'post#show'
  
  get 'post/search'

  get 'likes/likes_toggle/:id' => 'likes#likes_toggle'
  
  
  get 'post/ajaxCall' => 'post#ajaxCall' # 에이젝스 통신
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
