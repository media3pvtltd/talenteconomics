class Refbanner < Refinery::Core::BaseModel
  self.table_name = 'refinery_banners'
  attr_accessible :photo_id, :category
end  