Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Remove the incorrect Devise route for `models`
  # devise_for :models (This is incorrect and has been removed)

  # Custom routes for home
  get "home/index", to: "home#index", as: :home

  # Health check route for load balancers or uptime monitors
  get "up", to: "rails/health#show", as: :rails_health_check

  # Routes for PWA (Progressive Web App)
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest

  # Root path of the application
  root to: "home#index"

  # Expense tracker routes
  Rails.application.routes.draw do
    # Expense tracker routes
    get 'expenses/add_expense', to: 'expenses#add_expenses', as: 'add_expense'
    post 'expenses/add_expense', to: 'expenses#create'
    get 'expenses/:id/edit', to: 'expenses#edit', as: 'edit_expense'
    patch 'expenses/:id', to: 'expenses#update', as: 'expense'
    delete 'expenses/:id', to: 'expenses#destroy'
    get 'expenses/dashboard', to: 'expenses#dashboard', as: 'user_dashboard'
    get 'expenses/all_expenses', to: 'expenses#all_expenses', as: 'all_expenses'
    get 'budget/edit', to: 'expenses#edit_budget', as: 'edit_budget'
    patch 'budget/update', to: 'expenses#update_budget', as: 'update_budget'
  end

  delete 'expenses/:id', to: 'expenses#destroy'
end
