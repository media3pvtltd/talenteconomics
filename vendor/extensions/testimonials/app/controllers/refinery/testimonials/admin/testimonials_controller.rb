module Refinery
  module Testimonials
    module Admin
      class TestimonialsController < ::Refinery::AdminController

        crudify :'refinery/testimonials/testimonial',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
