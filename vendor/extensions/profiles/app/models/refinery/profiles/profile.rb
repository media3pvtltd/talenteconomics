module Refinery
  module Profiles
    class Profile < Refinery::Core::BaseModel
      self.table_name = 'refinery_profiles'

      attr_accessible :name, :location, :certification_date, :email, :content, :picture_id, :google_profile, :facebook_profile, :twitter_profile, :linkedin_profile, :position

      validates :name, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end
