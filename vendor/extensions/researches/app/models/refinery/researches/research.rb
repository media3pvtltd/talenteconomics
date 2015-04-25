module Refinery
  module Researches
    class Research < Refinery::Core::BaseModel
      self.table_name = 'refinery_researches'

      attr_accessible :title, :file_id, :link, :category, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :file, :class_name => '::Refinery::Resource'
    end
  end
end
