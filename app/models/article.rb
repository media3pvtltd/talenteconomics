class Article < ActiveRecord::Base
  attr_accessible :content, :photo_url, :title
  has_one :image
end
