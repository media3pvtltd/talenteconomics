Talentecnms::Application.routes.draw do
  resources :images
  
  get "wicked/index", to: 'wicked#index', as: 'wicked_index'
  get "wicked/testing", to: 'wicked#testing', as: 'wicked_testing'
  get "wicked/header", to: 'wicked#header', as: 'wicked_header'
  get "wicked/footer", to: 'wicked#footer', as: 'wicked_footer'
  get "wicked/download/:name", to: 'wicked#download', as: 'wicked_download'
  get "wicked/serve", to: 'wicked#serve', as: 'barrer'
  root :to => 'home#index'
  get "assessment/index"
  get "users/index"
  post "users/useremail"
  get '/user/:id', to: 'users#changepwd', as: 'changepassword'
  post 'users/updatepassword'
  get '/aboutme', to: 'about#index', as: 'about_me'
  get '/keynotes', to:"keynotes#index", as: 'keynotes'
  post '/keynotes', to:"keynotes#create", as: 'keynotes'
  get '/consulting', to:"consulting#index", as: 'consulting'
  get '/profiles', to:"ecprofiles#index", as: 'profiles'
  get '/profiles/:name', to:"ecprofiles#show", as: 'profile'

  get '/become-talent-ecomomist', to:"becomete#index", as: 'testme'
  #for mailer
  post '/become-talent-ecomomist', to:"becomete#contact"

  get '/signin', to:"users#signin", as: 'signin'
  post '/signin', to: 'users#create'
  get '/signout', to: 'users#destroy'
  get '/settings', to: 'users#myprofile', as: 'myprofile'
  get '/changepassword', to: 'users#change', as: 'changepwd'
  get '/changedetails', to: 'users#details', as: 'changedetails'
  put '/changedetails', to: 'users#changedet'
  put '/changepassword', to: 'users#changeput' 
  get '/forgotpassword', to: 'users#forgetpwd', as: 'forgetpwd'

  get '/blog', to:'blog#index', as: 'blog'
  get '/blog/:id', to:'blog#show', as: 'article'
  
  get '/assessment', to: 'assessment#index', as: 'assessment'
  get '/assessment/complete', to: 'assessment#complete', as: 'ass_completed'
  get "assessment/benchmark", to: 'assessment#benchmark', as: 'benchmarking'
  get "assessment/research-database", to: 'assessment#research', as: 'refresearches'
  get "assessment/autocomplete", :as => 'autocomplete'
  post "assessment/benchmark", to: 'assessment#results'
  post '/assessment', to: 'assessment#create', as: 'assessment'

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, :at => '/'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
