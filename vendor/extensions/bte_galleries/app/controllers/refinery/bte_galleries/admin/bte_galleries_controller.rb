module Refinery
  module BteGalleries
    module Admin
      class BteGalleriesController < ::Refinery::AdminController

        crudify :'refinery/bte_galleries/bte_gallery',
                :title_attribute => 'caption',
                :xhr_paging => true

      end
    end
  end
end
