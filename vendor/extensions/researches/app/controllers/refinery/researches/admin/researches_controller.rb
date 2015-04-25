module Refinery
  module Researches
    module Admin
      class ResearchesController < ::Refinery::AdminController

        crudify :'refinery/researches/research',
                :xhr_paging => true

      end
    end
  end
end
