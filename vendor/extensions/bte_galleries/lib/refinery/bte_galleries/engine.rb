module Refinery
  module BteGalleries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::BteGalleries

      engine_name :refinery_bte_galleries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "bte_galleries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.bte_galleries_admin_bte_galleries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/bte_galleries/bte_gallery',
            :title => 'caption'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::BteGalleries)
      end
    end
  end
end
