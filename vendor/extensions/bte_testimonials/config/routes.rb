Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :bte_testimonials do
    resources :bte_testimonials, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :bte_testimonials, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :bte_testimonials, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
