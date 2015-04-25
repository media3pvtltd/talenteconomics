Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :bte_galleries do
    resources :bte_galleries, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :bte_galleries, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :bte_galleries, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
