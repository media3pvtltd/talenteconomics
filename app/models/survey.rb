class Survey < ActiveRecord::Base
  attr_accessible :assessed_organization, :email, :first_name, :industry, :last_name, :organization, :region, :role, :title
  has_many :answers
end
