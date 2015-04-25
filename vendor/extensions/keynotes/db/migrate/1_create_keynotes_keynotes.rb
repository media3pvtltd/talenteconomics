class CreateKeynotesKeynotes < ActiveRecord::Migration

  def up
    create_table :refinery_keynotes do |t|
      t.string :title
      t.text :content
      t.float :latitude
      t.float :longitude
      t.datetime :date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-keynotes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/keynotes/keynotes"})
    end

    drop_table :refinery_keynotes

  end

end
