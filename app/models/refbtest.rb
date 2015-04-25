class Refbtest < Refinery::Core::BaseModel
  self.table_name = 'refinery_bte_testimonials'
  attr_accessible :name, :content
end  