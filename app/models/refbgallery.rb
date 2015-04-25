class Refbgallery < Refinery::Core::BaseModel
  self.table_name = 'refinery_bte_galleries'
  attr_accessible :photo, :caption
end  