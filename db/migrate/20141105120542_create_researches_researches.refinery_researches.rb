# This migration comes from refinery_researches (originally 1)
class CreateResearchesResearches < ActiveRecord::Migration

  def up
    create_table :refinery_researches do |t|
      t.string :title
      t.integer :file_id
      t.string :link
      t.integer :category
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-researches"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/researches/researches"})
    end

    drop_table :refinery_researches

  end

end
