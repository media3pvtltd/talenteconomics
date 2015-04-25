module Refinery
  module BteTestimonials
    class BteTestimonial < Refinery::Core::BaseModel
      self.table_name = 'refinery_bte_testimonials'

      attr_accessible :name, :content, :position

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
