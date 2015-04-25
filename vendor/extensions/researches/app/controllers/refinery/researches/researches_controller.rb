module Refinery
  module Researches
    class ResearchesController < ::ApplicationController

      before_filter :find_all_researches
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @research in the line below:
        present(@page)
      end

      def show
        @research = Research.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @research in the line below:
        present(@page)
      end

    protected

      def find_all_researches
        @researches = Research.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/researches").first
      end

    end
  end
end
