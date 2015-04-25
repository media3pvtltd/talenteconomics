module Refinery
  module Galleries
    module Admin
      class GalleriesController < ::Refinery::AdminController

        crudify :'refinery/galleries/gallery',
                :title_attribute => 'caption',
                :xhr_paging => true

      end
    end
  end
end
