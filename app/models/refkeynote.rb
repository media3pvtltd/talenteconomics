class Refkeynote < Refinery::Core::BaseModel
  self.table_name = 'refinery_keynotes'
  attr_accessible :title, :content, :latitude, :longitude
end  