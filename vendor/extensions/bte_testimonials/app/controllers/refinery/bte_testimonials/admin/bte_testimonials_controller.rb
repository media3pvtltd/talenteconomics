module Refinery
  module BteTestimonials
    module Admin
      class BteTestimonialsController < ::Refinery::AdminController

        crudify :'refinery/bte_testimonials/bte_testimonial',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
