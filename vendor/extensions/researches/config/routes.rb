Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :researches do
    resources :researches, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :researches, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :researches, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
