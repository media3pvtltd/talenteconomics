module Refinery
  module BteGalleries
    class BteGallery < Refinery::Core::BaseModel
      self.table_name = 'refinery_bte_galleries'

      attr_accessible :photo_id, :caption, :position

      validates :caption, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
