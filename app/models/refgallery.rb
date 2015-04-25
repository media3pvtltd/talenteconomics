class Refgallery < Refinery::Core::BaseModel
  self.table_name = 'refinery_galleries'
  attr_accessible :photo, :caption
end