module Refinery
  module Testimonials
    class Testimonial < Refinery::Core::BaseModel
      self.table_name = 'refinery_testimonials'

      attr_accessible :name, :content, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
