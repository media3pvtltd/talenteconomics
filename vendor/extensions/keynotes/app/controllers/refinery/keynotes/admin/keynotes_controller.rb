module Refinery
  module Keynotes
    module Admin
      class KeynotesController < ::Refinery::AdminController

        crudify :'refinery/keynotes/keynote',
                :xhr_paging => true

      end
    end
  end
end
