class Refprofile < Refinery::Core::BaseModel
  self.table_name = 'refinery_profiles'
  attr_accessible :name,:location,:certification_date,:email,:content,:picture_id,:google_profile,:facebook_profile,:twitter_profile,:linkedin_profile

 def to_param
     "#{id}-#{name}"
 end 
end  