class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true # You can use Image class with any other model you have.
  belongs_to :article
  mount_uploader :file, FileUploader
end
