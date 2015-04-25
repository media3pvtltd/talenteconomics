class Refarticle < Refinery::Core::BaseModel
  self.table_name = 'refinery_articles'
  attr_accessible :title, :content, :photo_id, :created_at
end