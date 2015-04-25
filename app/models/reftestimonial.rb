class Reftestimonial < Refinery::Core::BaseModel
  self.table_name = 'refinery_testimonials'
  attr_accessible :name, :content
end  