module Refinery
  module BteTestimonials
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::BteTestimonials

      engine_name :refinery_bte_testimonials

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "bte_testimonials"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.bte_testimonials_admin_bte_testimonials_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/bte_testimonials/bte_testimonial',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::BteTestimonials)
      end
    end
  end
end
