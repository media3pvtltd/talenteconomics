class RenamePictureUrlToPictureUid < ActiveRecord::Migration
  def change
    rename_column :articles, :photo_url, :photo_uid
  end
end
