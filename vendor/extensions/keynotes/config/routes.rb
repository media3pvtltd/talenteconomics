Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :keynotes do
    resources :keynotes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :keynotes, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :keynotes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
