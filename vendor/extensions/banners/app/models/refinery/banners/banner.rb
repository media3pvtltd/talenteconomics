module Refinery
  module Banners
    class Banner < Refinery::Core::BaseModel
      self.table_name = 'refinery_banners'

      attr_accessible :photo_id, :category, :position

      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        Refphoto.find(photo_id).image_name
      end

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
