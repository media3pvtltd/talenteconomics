module Refinery
  module Researches
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Researches

      engine_name :refinery_researches

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "researches"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.researches_admin_researches_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/researches/research'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Researches)
      end
    end
  end
end
