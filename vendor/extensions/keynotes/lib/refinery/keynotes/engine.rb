module Refinery
  module Keynotes
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Keynotes

      engine_name :refinery_keynotes

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "keynotes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.keynotes_admin_keynotes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/keynotes/keynote'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Keynotes)
      end
    end
  end
end
