class CreateBteGalleriesBteGalleries < ActiveRecord::Migration

  def up
    create_table :refinery_bte_galleries do |t|
      t.integer :photo_id
      t.string :caption
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-bte_galleries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bte_galleries/bte_galleries"})
    end

    drop_table :refinery_bte_galleries

  end

end
