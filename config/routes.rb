Moerderspiel::Application.routes.draw do
  resources :rankings

  resources :users
  resources :games
  resources :sessions
  resources :password_resets

  get "login"   => "sessions#new",        :as => "login"
  get "logout"  => "sessions#destroy",    :as => "logout"
  get "signup"  => "users#new",           :as => "signup"
  get "gamemaster" => "games#gamemaster", :as => "gamemaster"
  get "participate/:id" => "games#participate", :as => "participate"
  get "ranking" => "rankings#index", :as => "user_ranking"
  get "kill/:id" => "games#kill", :as => "kill"
  get "start/:id" => "games#start", :as => "start_game"
  get "end/:id" => "games#end_game", :as => "end_game"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'welcome/show_game_by_name'
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
