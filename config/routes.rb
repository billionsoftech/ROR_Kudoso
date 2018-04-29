Rails.application.routes.draw do

  resources :screen_times

  resources :activity_details

  resources :activity_types

  resources :activities

  resources :content_ratings

  resources :contents

  resources :content_descriptors

  resources :content_types

  resources :family_activities

  resources :activity_templates

  resources :devices

  resources :device_types

  resources :my_todos

  resources :todo_groups

  resources :todo_templates



  devise_for :users
  resources :families do
    resources :todo_groups do
      member do
        post :assign
      end
    end
    resources :members do
      resources :my_todos
    end
    resources :todos do
      resources :todo_schedules do
        resources :members do
          resources :my_todos
        end
      end
    end
  end

  root to: 'home#index'
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