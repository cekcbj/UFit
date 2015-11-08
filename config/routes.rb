Rails.application.routes.draw do
root 'dashboard#index'

  get 'signup' => 'users#new', as: :sign_up

   post 'users' => 'users#create'

   get 'users/discover' => 'users#discover', as: :discover
    get 'users/:id' => 'users#show', as: :user

   get '/signin' => 'sessions#new', as: :sign_in

   post '/signin' => 'sessions#create'

  delete '/sign_out' => 'sessions#delete', as: :sign_out

  get 'workouts' => 'workouts#new' , as: :workouts

  get 'workouts/:id/new' => 'workout_items#new', as: :workout_items

  post 'workouts/:id/new' => 'workout_items#create'

  post 'workouts' => 'workouts#create'

  get 'workouts/:id/' => 'workouts#show', as: :workout

  get 'workouts/exercises' => 'exercises#new', as: :exercises

  post 'workouts/exercises' => 'exercises#create'

    post "/users/:id/follow" => "following#create", as: :follow_user
    post "/users/:id/stop-following" => "following#delete", as: :stop_following_user
  post 'workouts/:id' => 'workouts#steal', as: :copy_workout


  post "/workouts/add/:exercise_id" => "workouts#add", as: :add_to_workout

  patch 'workouts/:id' => 'workouts#update'
  delete 'workouts/:id' => 'workouts#destroy', as: :delete_workout
  get 'workouts/:id/edit' => 'workouts#edit', as: :edit_workout

  namespace :api do
    get "workouts" =>  'workouts#index'
    get "workouts/:id" => 'workouts#show'
    post "workout_item/:id/complete" => 'workout_items#complete', as: :completed_workout_item
  end


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
