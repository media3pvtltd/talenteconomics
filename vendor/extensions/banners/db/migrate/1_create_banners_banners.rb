class CreateBannersBanners < ActiveRecord::Migration

  def up
    create_table :refinery_banners do |t|
      t.integer :photo_id
      t.integer :category
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-banners"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/banners/banners"})
    end

    drop_table :refinery_banners

  end

end
