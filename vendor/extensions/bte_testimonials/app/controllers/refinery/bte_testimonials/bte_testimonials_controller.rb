module Refinery
  module BteTestimonials
    class BteTestimonialsController < ::ApplicationController

      before_filter :find_all_bte_testimonials
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bte_testimonial in the line below:
        present(@page)
      end

      def show
        @bte_testimonial = BteTestimonial.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bte_testimonial in the line below:
        present(@page)
      end

    protected

      def find_all_bte_testimonials
        @bte_testimonials = BteTestimonial.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/bte_testimonials").first
      end

    end
  end
end
