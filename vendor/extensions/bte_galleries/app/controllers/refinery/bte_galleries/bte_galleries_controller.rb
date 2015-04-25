module Refinery
  module BteGalleries
    class BteGalleriesController < ::ApplicationController

      before_filter :find_all_bte_galleries
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bte_gallery in the line below:
        present(@page)
      end

      def show
        @bte_gallery = BteGallery.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bte_gallery in the line below:
        present(@page)
      end

    protected

      def find_all_bte_galleries
        @bte_galleries = BteGallery.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/bte_galleries").first
      end

    end
  end
end
