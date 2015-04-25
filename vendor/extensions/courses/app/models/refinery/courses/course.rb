module Refinery
  module Courses
    class Course < Refinery::Core::BaseModel
      self.table_name = 'refinery_courses'

      attr_accessible :place, :country, :held_on, :held_upto, :brochure_id, :photo_id, :position

      validates :place, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      belongs_to :brochure, :class_name => '::Refinery::Resource'
    end
  end
end
