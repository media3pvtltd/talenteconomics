module Refinery
  module Profiles
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Profiles

      engine_name :refinery_profiles

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "profiles"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.profiles_admin_profiles_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/profiles/profile',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Profiles)
      end
    end
  end
end
