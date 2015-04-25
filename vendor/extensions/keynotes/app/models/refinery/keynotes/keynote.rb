module Refinery
  module Keynotes
    class Keynote < Refinery::Core::BaseModel
      self.table_name = 'refinery_keynotes'

      attr_accessible :title, :content, :latitude, :longitude, :date, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
