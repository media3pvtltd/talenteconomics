class Refcourse < Refinery::Core::BaseModel
  self.table_name = 'refinery_courses'
  attr_accessible :place, :country, :held_on, :held_upto, :brochure_id, :photo_id
end  