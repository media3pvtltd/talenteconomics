class Reffile < Refinery::Core::BaseModel
  self.table_name = 'refinery_resources'
  attr_accessible :file_name, :file_uid
end  